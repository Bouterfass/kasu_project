class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])

    @user_collection = @user.mangas
  end

  def edit
    @user = User.find(params[:id])

    @user_collection = LibraryItem.where(user: current_user)

    puts @user_collection
  end
end
