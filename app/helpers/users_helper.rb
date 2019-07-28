module UsersHelper

  def edit_user_path user
    "#{root_url}users/#{user.id}/edit"
  end

end
