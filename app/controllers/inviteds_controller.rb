class InvitedsController < ApplicationController
  before_action :authenticate

  def index
  end

  def destroy
    @invited = Invited.find(params[:id])
    @invited.destroy
    redirect_to a_i_path
  end

  private

  # si el usuario no es invitado ni administrador que no pueda entrar
  def authenticate
    if !session[:invited] && !session[:admin]
      redirect_to root_path
    end
  end

end
