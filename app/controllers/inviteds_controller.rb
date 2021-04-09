class InvitedsController < ApplicationController
  before_action :authenticate, except: :create

  def index
  end

  def create
    @invited = Invited.new(invited_params)
    if @invited.save
      MarriageInvited.create(
        marriage_id: session[:marriage],
        invited_id: @invited.id
      )
      respond_to do |format|
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to m_s_path(error: 'el invitado no pudo ser creado') }
      end
    end
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

  def invited_params
    params.require(:invited).permit(:name, :last_name, :phone, :email, :password_digest)
  end

end
