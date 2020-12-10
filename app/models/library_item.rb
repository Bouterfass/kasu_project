class LibraryItem < ApplicationRecord
  belongs_to :user
  belongs_to :manga
  has_many :conversations, dependent: :destroy
  
#   def self.search(search)  
#     where("lower(manga.title) LIKE :search OR lower(library_items.manga.title) LIKE :search", search: "%#{search.downcase}%").uniq   
#  end

end
