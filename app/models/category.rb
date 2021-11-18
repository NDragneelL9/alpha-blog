class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 14 }
  validates_uniqueness_of :name
end