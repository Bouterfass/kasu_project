class Manga < ApplicationRecord
  has_many :library_items
  has_many :users, through: :library_items
  has_many :wishlist_items
  has_many :join_manga_categories
  has_many :categories, through: :join_manga_categories

  has_one_attached :cover
end
