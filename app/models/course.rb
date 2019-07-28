class Course < ApplicationRecord

  # relacionamentos
  belongs_to :forum
  has_many   :comments, :dependent => :delete_all
  has_many   :posts,    :dependent => :delete_all

  # validações
  validates :title,    presence: true, uniqueness: true, length: {minimum: 3}
  validates :forum_id, presence: true

end
