require 'rails_helper'

RSpec.describe User, type: :model do
  context "Post - Testando as validações" do

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

    it "Campo title valendo nil" do
      post = Post.new
      post.title  = nil
      post.content = "bla bla bla"
      post.course_id = 1
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo title com comprimento menor do que o esperado" do
      post = Post.new
      post.title  = "AB"
      post.content = "bla bla bla"
      post.course_id = 1
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo content valendo nil" do
      post = Post.new
      post.title  = "ABCD"
      post.content = nil
      post.course_id = 1
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo content com comprimento menor do que o esperado" do
      post = Post.new
      post.title  = "ABCD"
      post.content = "bl"
      post.course_id = 1
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo course_id valendo nil" do
      post = Post.new
      post.title  = "ABCD"
      post.content = "bla bla bla"
      post.course_id = nil
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo course_id valendo algo não permitido" do
      post = Post.new
      post.title  = "ABCD"
      post.content = "bla bla bla"
      post.course_id = 1000
      post.user_id = 1
      expect(post.valid?).to be_falsey
    end

    it "Campo user_id valendo nil" do
      post = Post.new
      post.title  = "ABCD"
      post.content = "bla bla bla"
      post.course_id = 1
      post.user_id = nil
      expect(post.valid?).to be_falsey
    end

    it "Campo user_id valendo algo não permitido" do
      post = Post.new
      post.title  = "ABCD"
      post.content = "bla bla bla"
      post.course_id = 1
      post.user_id = 1000
      expect(post.valid?).to be_falsey
    end

    it "Sem erro de validações" do
      post = Post.new
      post.title  = "Título"
      post.content = "bla bla bla"
      post.course_id = 1
      post.user_id = 1
      expect(post.valid?).to be_truthy
    end

    # limpeza
    forum.destroy
    course.destroy
    user.destroy

  end
end


