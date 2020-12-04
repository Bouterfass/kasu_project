class LibraryItemsController < ApplicationController

    before_action :authenticate_user!

    def index
        @pagy, @items = pagy(LibraryItem.all)
    end
    
    def show
        @item = LibraryItem.find(params[:id])
    end
    
    def create
        puts "Hola!!"
        puts params
        @item = LibraryItem.create(state_description: "une description", user: current_user, manga_id:params[:manga_id])
        redirect_to user_path(current_user)
 
    end

    def destroy 
        @item = LibraryItem.find(params[:id])
        #@manga = Manga.find(params[:manga_id])
        #@item = LibraryItem.where(user: current_user, manga_id:@manga.id)

        puts @item
        @item.destroy
        redirect_to '/users/' + current_user.id.to_s
    end   
       
   
end
