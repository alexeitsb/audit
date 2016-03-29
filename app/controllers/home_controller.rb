class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to entries_path
    else
      redirect_to sessions_new_path
    end
  end
end