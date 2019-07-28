require 'rails_helper'

RSpec.describe User, type: :model do
  context "Course - Testando as validações" do

    # cadastra um forum para os testes
    forum = Forum.new
    forum.title = "Title"
    forum.description = "..."
    forum.save

    it "Campo title valendo nil" do
      course = Course.new
      course.title  = nil
      course.description = "bla bla bla"
      course.forum_id = 1
      expect(course.valid?).to be_falsey
    end

    it "Campo title menor do que o esperado" do
      course = Course.new
      course.title  = "AB"
      course.description = "bla bla bla"
      course.forum_id = 1
      expect(course.valid?).to be_falsey
    end

    it "Campo title sendo único" do
      course = Course.new
      course.title  = "Título01"
      course.description = "bla bla bla"
      course.forum_id = 1
      course.save
      
      other = Course.new
      other.title = "Título01"
      other.description = "bla bla"
      other.forum_id = 1
      expect(other.valid?).to be_falsey
      course.destroy
    end

    it "Campo forum_id valendo nil" do
      course = Course.new
      course.title  = "Título02"
      course.description = "bla bla bla"
      course.forum_id = nil
      expect(course.valid?).to be_falsey
    end

    it "Campo forum_id valendo algo não permitido" do
      course = Course.new
      course.title  = "Título02"
      course.description = "bla bla bla"
      course.forum_id = 1000
      expect(course.valid?).to be_falsey
    end

    it "Sem erro de validações" do
      course = Course.new
      course.title  = "Título02"
      course.description = "bla bla bla"
      course.forum_id = 1
      expect(course.valid?).to be_truthy
    end

    # limpeza
    forum.destroy

  end
end

