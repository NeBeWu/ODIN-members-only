class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy add_like remove_like add_dislike remove_dislike]
  before_action :authenticate_user!, except: %i[index show]

  helper PostsHelper

  # GET /posts or /posts.json
  def index
    @new_post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @new_post = Post.new
    @replies = @post.replies
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_back_or_to :root, notice: 'Post was successfully created.'
    elsif @post.reply?
      create_from_show
    else
      create_from_index
    end
  end

  def create_from_index
    @posts = Post.all.order('created_at DESC')

    render :index, status: :unprocessable_entity
  end

  def create_from_show
    @new_post = @post
    @post = Post.find(@post.parent_id)
    @replies = @post.replies

    render :show, status: :unprocessable_entity
  end

  def add_like
    if request.post?
      @post.likes << current_user
      @post.dislikes.delete current_user

      redirect_back_or_to :root
    else
      render :index, status: :unprocessable_entity
    end
  end

  def remove_like
    if request.delete?
      @post.likes.delete current_user

      redirect_back_or_to :root
    else
      render :index, status: :unprocessable_entity
    end
  end

  def add_dislike
    if request.post?
      @post.dislikes << current_user
      @post.likes.delete current_user

      redirect_back_or_to :root
    else
      render :index, status: :unprocessable_entity
    end
  end

  def remove_dislike
    if request.delete?
      @post.dislikes.delete current_user

      redirect_back_or_to :root
    else
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update; end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.user == current_user
      @post.destroy

      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    else
      @new_post = Post.new
      @replies = @post.replies

      redirect_to post_url, alert: 'You cannot delete this post.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :user_id, :parent_id, :source_id)
  end
end
