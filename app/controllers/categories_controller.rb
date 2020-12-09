class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @pagy, @mangas = pagy(@category.mangas)    
  end
end
