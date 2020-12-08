class WishlistItemsController < ApplicationController
    
    before_action :authenticate_user!

    def create
 
        @item = WishlistItem.create(user: current_user, manga_id:params[:manga_id])
        redirect_to user_path(current_user)
 
    end


    def destroy 
        @item = WishlistItem.find(params[:id])
        #@manga = Manga.find(params[:manga_id])
        #@item = LibraryItem.where(user: current_user, manga_id:@manga.id)

        puts @item
        @item.destroy
        redirect_to '/users/' + current_user.id.to_s
    end   
end
