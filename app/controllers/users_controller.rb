class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :is_user?

  def show
    @user = User.find(params[:id])

    @user_collection = @user.mangas
  end

  def edit
    @user = User.find(params[:id])

    @user_collection = LibraryItem.where(user: current_user)

    puts @user_collection
  end

  private
  
  def is_user?
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:alert] = "action impossible !"
      redirect_to "/"
    end
  end

end
