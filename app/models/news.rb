class News < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  validates :title, :description, :image, presence: true
end
