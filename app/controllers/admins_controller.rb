class AdminsController < ApplicationController
  http_basic_authenticate_with name:'david', password:'david', only: :new
  before_action :authenticate, only: :index

  def index
    @marriages = Marriage.all
    @inviteds = Invited.all
    @ceremonies = Ceremony.all
    @celebrations = Celebration.all
  end

  #informacion que aparecera en la vista show de administradores
  def show
    if params[:marriage]
      @marriage = Marriage.find(params[:marriage])
    elsif params[:invited]
      @invited = Invited.find(params[:invited])
    end
  end

  def new
    @admin = Admin.new
  end


  #inicio de sesion de administrador
  def create
    @admin = Admin.find_by(
      name: params[:admin][:name],
      password_digest: params[:admin][:password]
    )
    if @admin
      session[:admin] = @admin.id
      redirect_to a_i_path
    else
      redirect_to a_n_path(error_autenticacion: 'admin')
    end
  end

  def update
    if params[:marriage]
      @marriage = Marriage.find(params[:id])
      @marriage.update(marriage_params)
      redirect_to a_i_path
    elsif params[:invited]
      @invited = Invited.find(params[:id])
      @invited.update(invited_params)
      redirect_to a_i_path
    end
  end

  def destroy
    @marriage = Marriage.find(params[:id])
    @marriage.destroy
    redirect_to a_i_path
  end

  private

  def authenticate
    if !session[:admin]
      redirect_to root_path
    end
  end

  def marriage_params
    params.require(:marriage).permit(:name1, :name2, :phone_name1, :phone_name2, :email_name1, :email_name2, :link_gift, :code_gift)
  end

  def invited_params
    params.require(:invited).permit(:name, :last_name, :phone, :email)
  end
end
