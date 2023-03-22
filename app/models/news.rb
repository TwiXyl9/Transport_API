class News < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  validates :title, :description, presence: true, uniqueness: true
end
