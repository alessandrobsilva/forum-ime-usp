require 'rails_helper'

RSpec.describe User, type: :model do
  context "User - Testando as validações" do

    it "Campo nome valendo nil" do
      user = User.new
      user.name = nil
      user.email = "teste@teste.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Campo nome com comprimento menor do que o esperado" do
      user = User.new
      user.name = "AB"
      user.email = "teste@teste.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Campo email valendo nil" do
      user = User.new
      user.name = "Teste"
      user.email = nil
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Campo email com comprimento menor do que o esperado" do
      user = User.new
      user.name = "Teste"
      user.email = "@.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Campo email sem o arroba" do
      user = User.new
      user.name = "Teste"
      user.email = "teste12345"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Campo email sendo único" do
      user = User.new
      user.name = "Teste"
      user.email = "teste@teste.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      user.save

      other = User.new
      other.name = "Teste"
      other.email = "teste@teste.com"
      other.role = "admin"
      other.password = "123456789"
      other.password_confirmation = "123456789"
      expect(other.valid?).to be_falsey
      user.destroy
    end

    it "Campo role valendo nil" do
      user = User.new
      user.name = "Teste"
      user.email = "test@test.com"
      user.role = nil
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_falsey
    end

    it "Sem senha cadastrada" do
      user = User.new
      user.name = "Teste"
      user.email = "test@test.com"
      user.role = "admin"
      expect(user.valid?).to be_falsey
    end

    it "Senhas fornecidas não são iguais" do
      user = User.new
      user.name = "Teste"
      user.email = "test@test.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "234567890"
      expect(user.valid?).to be_falsey
    end

    it "Sem erro de validações" do
      user = User.new
      user.name = "Teste"
      user.email = "test@test.com"
      user.role = "admin"
      user.password = "123456789"
      user.password_confirmation = "123456789"
      expect(user.valid?).to be_truthy
    end
  end
end
