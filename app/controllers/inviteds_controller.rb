class InvitedsController < ApplicationController
  before_action :authenticate

  def index
  end

  private

  def authenticate
    if !session[:invited]
      redirect_to root_path
    end
  end

end
