class Dish < ApplicationRecord
  validates :name, presence: true
  validates :dish, presence: true
end
