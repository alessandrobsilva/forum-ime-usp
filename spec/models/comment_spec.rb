require 'rails_helper'

RSpec.describe User, type: :model do
  context "Comment - Testando as validações" do

    # cadastra um forum para os testes
    forum = Forum.new
    forum.title = "Title"
    forum.description = "..."
    forum.save

    # cadastra um curso para os testes
    course = Course.new
    course.title = "Title"
    course.description = "..."
    course.forum_id = 1
    course.save

    # cadastra um usuário para os testes
    user = User.new
    user.name = "User"
    user.email = "user@user.com"
    user.role = "user"
    user.password = "123456789"
    user.password_confirmation = "123456789"
    user.save

    # cadastra um novo post para os testes
    post = Post.new
    post.title  = "Título"
    post.content = "bla bla bla"
    post.course_id = 1
    post.user_id = 1
    post.save

    it "Campo content valendo nil" do
      comment = Comment.new
      comment.content = nil
      comment.course_id = 1
      comment.post_id = 1
      comment.user_id = 1
      expect(comment.valid?).to be_falsey
    end

    it "Campo course_id valendo nil" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = nil
      comment.post_id = 1
      comment.user_id = 1
      expect(comment.valid?).to be_falsey
    end

    it "Campo course_id valendo algo não permitido" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1000
      comment.post_id = 1
      comment.user_id = 1
      expect(comment.valid?).to be_falsey
    end

    it "Campo post_id valendo nil" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1
      comment.post_id = nil
      comment.user_id = 1
      expect(comment.valid?).to be_falsey
    end

    it "Campo post_id valendo algo não permitido" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1
      comment.post_id = 1000
      comment.user_id = 1
      expect(comment.valid?).to be_falsey
    end

    it "Campo user_id valendo nil" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1
      comment.post_id = 1
      comment.user_id = nil
      expect(comment.valid?).to be_falsey
    end

    it "Campo user_id valendo algo não permitido" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1
      comment.post_id = 1
      comment.user_id = 1000
      expect(comment.valid?).to be_falsey
    end

    it "Sem erro de validações" do
      comment = Comment.new
      comment.content = "bla bla bla"
      comment.course_id = 1
      comment.post_id = 1
      comment.user_id = 1
      expect(comment.valid?).to be_truthy
    end

    # limpeza
    forum.destroy
    course.destroy
    user.destroy
    post.destroy

  end
end



