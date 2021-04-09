class InvitationsController < ApplicationController
  def update
    @invitation = TemplateInvitation.find(params[:template])
    @invitation.marriage_id = session[:marriage]
    @invitation.update(invitation_params)
    respond_to do |format|
      format.html { redirect_to m_s_path(producto: 'invitaciones') }
      format.js { }
    end
  end

  private

  def invitation_params
    params.permit(:marriage_id, :message_personalized)
  end
end
