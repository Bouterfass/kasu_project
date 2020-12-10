class StaticPagesController < ApplicationController
  def index
    @manga = LibraryItem.last(4)
    @user = User.last(3)
  end

  def search  
    if params[:search].blank?  
      redirect_to(mangas_path, alert: "Champ vide!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Manga.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end   
  end  

  def libsearch  

    if params[:search].blank? 
      redirect_to(library_items_path, alert: "Champ vide!") and return 
    else  
      @libparameter = params[:search].downcase   
      @items = []
      
      LibraryItem.all.each do |item|
        if (item.manga.title).include?(params[:search])
        @items << item
          end
        end       
    end 
  end
  
  # @libresults = LibraryItem.all.where("lower(self.manga.title) LIKE :search", search: "%#{@libparameter}%")  
  # puts @libresults
end
