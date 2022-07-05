module PostsHelper
  def time_passed(post)
    time_difference = Time.zone.now - post.created_at
    if time_difference < 3600
      "#{(time_difference / 60).ceil}m"
    elsif time_difference < 86_400
      "#{(time_difference / 3600).ceil}h"
    else
      "#{post.created_at.strftime('%b')} #{post.created_at.day}"
    end
  end

  def current_user_repost?(post)
    post.repost? && post.user_id == current_user.id
  end

  def source_of_current_user_repost?(post)
    post.reposts.any? do |repost|
      repost.user_id == current_user.id
    end
  end

  def check_repost?(post)
    current_user_repost?(post) || source_of_current_user_repost?(post)
  end

  def select_current_user_repost(post)
    post.reposts.select do |repost|
      repost.user_id == current_user.id
    end.first
  end

  def check_like?(resource)
    resource.likes.any? do |like|
      like.id == current_user.id
    end
  end

  def check_dislike?(resource)
    resource.dislikes.any? do |dislike|
      dislike.id == current_user.id
    end
  end
end
