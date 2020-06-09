class Flower < ApplicationRecord
  validates :name, presence: true
  validates :color,  presence: true
  validates :cost, presence: true
end
