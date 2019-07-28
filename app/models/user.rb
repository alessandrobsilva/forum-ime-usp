class User < ApplicationRecord

  # avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # relacionamentos
  has_many :comments, :dependent => :delete_all
  has_many :posts,    :dependent => :delete_all

  # validações
  validates :name,  presence: true, length: {minimum: 3}
  validates :email, presence: true, length: {minimum: 7}, uniqueness: true
  validates :role,  presence: true

  # tipos de users
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

end
