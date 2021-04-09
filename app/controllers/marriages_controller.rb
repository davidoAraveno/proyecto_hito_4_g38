class MarriagesController < ApplicationController
  before_action :authenticate

  def index
    @marriage = Marriage.find(session[:marriage])
  end

  def new
    @marriage = Marriage.new
  end

  #crear matrimonio de parte de los administradores
  def create
    @marriage = Marriage.new(marriage_params)
    @marriage.save
    redirect_to a_i_path
  end

  def update
    @marriage = Marriage.find(params[:id])
    @marriage.update(marriage_params)
    respond_to do |format|
      format.js { }
    end
  end

  private

  # /// si no es matrimonio ni administrador, que no pueda entrar al index de matrimonios//////
  def authenticate
    if !session[:marriage] && !session[:admin]
      redirect_to root_path
    end
  end

  def marriage_params
    params.require(:marriage).permit(:name1, :name2, :phone_name1, :phone_name2, :email_name1, :email_name2, :link_gift, :code_gift, :enterprise_gift)
  end

end
