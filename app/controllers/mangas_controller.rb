class MangasController < ApplicationController
  def index
    @pagy, @mangas = pagy(Manga.all)
    @all_libraries = []
    LibraryItem.all.each{|item| @all_libraries << item.manga.id}
  end

  def show
    @manga = Manga.find(params[:id])
    @items = LibraryItem.where(manga:@manga)
    @all_volumes = @manga.integer_to_array(@manga.volume)

  end
  
  def edit
    @manga = Manga.find(params[:id])
  end

  def new
    @manga = Manga.new
  end

  def create
    manga = Manga.create(manga_params)
    redirect_to manga_path(manga.id)
  end
  

  def update
  end

  def destroy
  end

  def manga_params
      params.require(:manga).permit(:image_url, :title, :author, :description)
  end
end

