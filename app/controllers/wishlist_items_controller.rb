class WishlistItemsController < ApplicationController
    
    before_action :authenticate_user!

    def create
        puts "*"*100
        puts params
        puts "*"*100
        @item = WishlistItem.create(user: current_user, manga_id:params[:manga_id], volume: params[:manga][:volume])
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
