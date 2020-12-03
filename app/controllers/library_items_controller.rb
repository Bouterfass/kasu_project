class LibraryItemsController < ApplicationController


    def index
        @pagy, @items = pagy(LibraryItem.all)
    end
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
