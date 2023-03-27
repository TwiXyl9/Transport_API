class AdditionalService < ApplicationRecord
  validates :name, :price, presence: true
end
