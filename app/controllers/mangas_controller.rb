class MangasController < ApplicationController
  def index
    @pagy, @mangas = pagy(Manga.all)
  end

  def show
<<<<<<< HEAD
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
=======
  end

  def edit
  end

  def create
  end

  def new
>>>>>>> develop
  end

  def update
  end

  def destroy
  end
<<<<<<< HEAD

  def manga_params
    manga_params = params.require(:manga).permit(:title, :author, :description, :cover)
  end

end

=======
end
>>>>>>> develop
