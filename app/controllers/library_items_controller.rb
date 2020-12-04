class LibraryItemsController < ApplicationController

    before_action :authenticate_user!

    # On peut ajouter/enlever une ligne de library_items sur les liens suivants : 
    #localhost:3000/mon_profil/edit (destroy et redirection index mangas pour ajouter celui qu'il veut)
    #localhost:3000/manga/16/show

    def new
        @library_item = LibraryItem.new
    end
    
    def show
        @item = LibraryItem.find(params[:id])
    end
    
    def create
        puts "Hola!!"
        puts params
        @item = LibraryItem.create(state_description: "une description", user: current_user, manga_id:params[:manga_id])
        redirect_to edit_user_path(current_user)
 
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
