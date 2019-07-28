class Forum < ApplicationRecord

  # relacionamentos
  has_many :courses

  # validações
  validates :title, presence: true, uniqueness: true, length: {minimum: 3}

end
