class News < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true
end
