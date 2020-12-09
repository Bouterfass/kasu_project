class LibraryItemsController < ApplicationController

    before_action :authenticate_user!

    def index
        @pagy, @items = pagy(LibraryItem.all)
        @categories = Category.all
    end
    
    def show
        @item = LibraryItem.find(params[:id])
    end
    
    def create

        @item = LibraryItem.create(user: current_user, manga_id:params[:manga_id], state_description: params[:manga][:description], volume: params[:manga][:volume])
        @all_wishlist = WishlistItem.where(manga_id: params[:manga_id])
        @all_wishlist.each do |item|
            UserMailer.match_email(item.user, @item).deliver_now
        end

        redirect_to user_path(current_user), success: "Manga ajouté de votre bibliothèque !"
    end

    def update
        @item = LibraryItem.find(params[:id])
        token = @item.user.token_state
        token += 1
        current_user_token = current_user.token_state
        current_user_token -=1
        
        if current_user_token < 0
            current_user.update(token_state: 0)
        else
            current_user.update(token_state: current_user_token)
        end
        @item.user.update(token_state: token)
        @item.destroy
        redirect_to '/', success: 'Echange réalisé avec succès !'
    end

    def destroy 
        @item = LibraryItem.find(params[:id])
        @item.destroy
        redirect_to '/users/' + current_user.id.to_s, danger: "Manga supprimé de votre bibliothèque !"
    end   
       
   
end
