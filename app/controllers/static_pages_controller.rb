class StaticPagesController < ApplicationController
  def index
    @manga = LibraryItem.last(5)
    @user = User.last(3)
  end
end
