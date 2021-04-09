class SessionsController < ApplicationController
  def new
    @marriage = Marriage.new
    @invited = Invited.new
  end

  def create
    if params[:marriage]

      @marriage = Marriage.find_by(
        password_digest: params[:marriage][:password]
      )
      if @marriage
        session[:marriage] = @marriage.id
        redirect_to m_i_path
      else
        redirect_to root_path(error_autenticacion: 'novios')
      end

    elsif params[:invited]

      @invited = Invited.find_by(
        password_digest: params[:invited][:password]
      )
      if @invited
        session[:invited] = @invited.id
        redirect_to i_i_path
      else
        redirect_to root_path(error_autenticacion: 'invitado')
      end
    end
  end

  def destroy
    reset_session
	  redirect_to root_path
  end
end
