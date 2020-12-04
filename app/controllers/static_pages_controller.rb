class StaticPagesController < ApplicationController
  def index
    @manga = LibraryItem.last(4)
    @user = User.last(3)
  end
end
