class Manga < ApplicationRecord
  has_many :library_items
  has_many :users, through: :library_items

  has_one_attached :cover
end
