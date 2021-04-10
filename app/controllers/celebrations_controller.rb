class CelebrationsController < ApplicationController
  def update
    @celebration = Celebration.find(params[:id])
    @celebration.update(celebration_params)
    respond_to do |format|
      format.js { }
    end
  end

  private

  def celebration_params
    params.require(:celebration).permit(:address, :hour, :date)
  end
end
