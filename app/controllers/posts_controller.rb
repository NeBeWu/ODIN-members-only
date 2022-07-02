class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  helper PostsHelper

  # GET /posts or /posts.json
  def index
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @reply = Post.new
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
    elsif @post.parent_id.nil?
      create_from_index
    else
      create_from_show
    end
  end

  def create_from_index
    @posts = Post.all.order('created_at DESC')

    render :index, status: :unprocessable_entity
  end

  def create_from_show
    @reply = @post
    @post = Post.find(@post.parent_id)
    @replies = @post.replies

    render :show, status: :unprocessable_entity
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update; end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
