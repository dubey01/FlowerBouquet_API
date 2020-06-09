class Bouquet < ApplicationRecord
  validates :name, presence: true
  validates :size,  presence: true
  validates :cost, presence: true
end
