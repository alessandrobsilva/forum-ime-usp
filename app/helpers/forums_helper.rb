module ForumsHelper

  # grava em @post o último post de um curso
  def last_post course
    if course.posts.size > 0
      @post = posts_of(course).first
    else
      @post = nil
    end
  end

  def new_course forum
    "#{new_course_path}/#{forum.id}"
  end

  def number_of_posts course
    course.posts.size
  end
  
  def number_of_messages course
    count = number_of_posts course
    course.posts.each do |post|
      count += post.comments.size
    end
    count
  end
  
  def courses_of forum
    forum.courses.sort_by{ |item| item[:title] }
  end
  
  def number_of_all_messages
    "#{Comment.all.size + Post.all.size}"
  end
  
  def number_of_users
    "#{User.all.size}"
  end
  
  def last_user_name
    if User.all.size > 0
      User.last.name
    else
      "Indefinido"
    end
  end

end
