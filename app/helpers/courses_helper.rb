module CoursesHelper

  def new_post course
    "#{new_post_path}/#{course.id}"
  end

  # retorna a data da última interação em um post
  def last_interation post
    if post.comments.size > 0
      post.comments.last.created_at
    else
      post.created_at
    end
  end

  # ordena a lista de posts em um curso
  def posts_of course
    course.posts.sort_by{ |item| last_interation(item) }.reverse
  end

end
