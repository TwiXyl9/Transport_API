class Car < ApplicationRecord
  belongs_to :capacity, dependent: :destroy
end
