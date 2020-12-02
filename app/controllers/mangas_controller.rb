class MangasController < ApplicationController
  def index
  end

  def show
    @manga = Manga.find(params[:id])
  end
  
  def edit
    @manga = Manga.find(params[:id])
  end

  def create
    manga = Manga.create(manga_params)
    redirect_to manga_path(manga.id)
  end
  
  def new
    @manga = Manga.new
  end

  def update
  end

  def destroy
  end

  def manga_params
    manga_params = params.require(:manga).permit(:title, :author, :description, :cover)
  end

end

