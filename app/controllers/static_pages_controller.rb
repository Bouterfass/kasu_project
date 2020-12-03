class StaticPagesController < ApplicationController
  def index
    @manga = Manga.last(5)
    
  end
end
