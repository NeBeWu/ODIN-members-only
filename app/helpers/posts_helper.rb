module PostsHelper
  def time_passed(post)
    time_difference = Time.zone.now - post.created_at
    if time_difference < 3600
      "#{(time_difference / 60).ceil}m"
    elsif time_difference < 86_400
      "#{(time_difference / 3600).ceil}h"
    else
      "#{post.created_at.strftime("%b")} #{post.created_at.day}"
    end
  end
end
