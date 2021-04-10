class CeremoniesController < ApplicationController
  def update
    @ceremony = Ceremony.find(params[:id])
    @ceremony.update(ceremony_params)
    respond_to do |format|
      format.js {  }
    end
  end

  private

  def ceremony_params
    params.require(:ceremony).permit(:address, :hour, :date)
  end
end
