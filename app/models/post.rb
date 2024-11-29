class Post < ApplicationRecord
  has_one_attached :image
  has_many :musics
  belongs_to :user
  validates :title, presence: true
  
end
