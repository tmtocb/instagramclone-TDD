class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :description, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
