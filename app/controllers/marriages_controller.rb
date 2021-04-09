class MarriagesController < ApplicationController
  before_action :authenticate

  def index
  end

  private

  def authenticate
    if !session[:marriage]
      redirect_to root_path
    end
  end

end
