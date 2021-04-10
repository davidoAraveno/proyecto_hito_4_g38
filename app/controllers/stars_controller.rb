class StarsController < ApplicationController
  def new
    @star = Star.new
    @stars = Star.all
  end

  def create
    @star = Star.new(star_params)
    @star.marriage_id = session[:marriage]
    @star.save
    respond_to do |format|
      format.js {  }
    end
  end

  private

  def star_params
    params.require(:star).permit(:calification, :marriage_id, :message)
  end
end
