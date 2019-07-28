class Post < ApplicationRecord

  # imagem anexa
  has_attached_file :picture, :styles => { :medium => "500x500>", :big => "900x900>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  # relacionamentos
  belongs_to :user
  belongs_to :course
  has_many   :comments, :dependent => :delete_all

  # validações
  validates :title,     presence: true, length: {minimum: 3}
  validates :content,   presence: true, length: {minimum: 3}
  validates :course_id, presence: true
  validates :user_id,   presence: true

end
