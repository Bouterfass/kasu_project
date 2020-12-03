class LibraryItemsController < ApplicationController


    def index
        @pagy, @items = pagy(LibraryItem.all)
    end
    def create
        puts "Hola!!"
        puts params
        @item = LibraryItem.create(user: current_user, manga_id:params[:manga_id])
        redirect_to edit_user_path(current_user)
        #localhost:3000/manga/:id/show
        #@item.create(user: current_user, manga_id: params[:id])
    end

    def destroy 
        @item = LibraryItem.find(params[:id])
        #@manga = Manga.find(params[:manga_id])
        #@item = LibraryItem.where(user: current_user, manga_id:@manga.id)

        puts @item
        puts "Hello"

        @item.destroy

        redirect_to '/users/' + current_user.id.to_s + '/edit'
    end   
       
    
end
