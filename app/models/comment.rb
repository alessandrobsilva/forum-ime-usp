class Comment < ApplicationRecord

  # imagem anexa
  has_attached_file :picture, :styles => { :medium => "500x500>", :big => "900x900>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  # relacionamentos
  belongs_to :course
  belongs_to :post
  belongs_to :user

  # validações
  validates :content,   presence: true
  validates :course_id, presence: true
  validates :post_id,   presence: true
  validates :user_id,   presence: true

end
