class StaticPagesController < ApplicationController
  def index
    @manga = LibraryItem.last(4)
    @user = User.last(3)
  end

  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Manga.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end   
  
  end  

end
