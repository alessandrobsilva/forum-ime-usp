module PostsHelper

  def comments_of post
    post.comments.sort_by{ |item| item[:created_at] }
  end

  def new_comment post
    "#{new_comment_path}/#{post.id}"
  end

end
