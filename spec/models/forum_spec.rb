require 'rails_helper'

RSpec.describe User, type: :model do
  context "Forum - Testando as validações" do

    it "Campo title valendo nil" do
      forum = Forum.new
      forum.title  = nil
      forum.description = "bla bla bla"
      expect(forum.valid?).to be_falsey
    end

    it "Campo title menor do que o esperado" do
      forum = Forum.new
      forum.title  = "AB"
      forum.description = "bla bla bla"
      expect(forum.valid?).to be_falsey
    end

    it "Campo title sendo único" do
      forum = Forum.new
      forum.title  = "Título01"
      forum.description = "bla bla bla"
      forum.save
      
      other = Forum.new
      other.title = "Título01"
      other.description = nil
      expect(other.valid?).to be_falsey
      forum.destroy
    end

    it "Sem erros de validações" do
      forum = Forum.new
      forum.title = "Título"
      forum.description = "bla bla bla"
      expect(forum.valid?).to be_truthy
    end
  end
end
