class LibraryItemsController < ApplicationController


    # On peut ajouter/enlever une ligne de library_items sur les liens suivants : 
    #localhost:3000/mon_profil/edit (destroy et redirection index mangas pour ajouter celui qu'il veut)
    #localhost:3000/manga/16/show

    def create

        @item = LibraryItem.new
        
        #localhost:3000/manga/:id/show
        @item.create(user: current_user, manga_id: params[:id])

    end

    def destroy
        @item = LibraryItem.find(params[:id])

        @item.destroy

        redirect_to '/users/' + current_user.id.to_s + '/edit'
    end   
       

    
end
