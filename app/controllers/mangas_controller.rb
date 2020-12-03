class MangasController < ApplicationController
  def index
    @pagy, @mangas = pagy(Manga.all)
  end

  def show
  end

  def edit
  end

  def create
  end

  def new
  end

  def update
  end

  def destroy
  end
end
