module UsersHelper
  def join_date(user)
    "Joined #{user.created_at.strftime('%B')} #{user.created_at.year} "
  end
end
