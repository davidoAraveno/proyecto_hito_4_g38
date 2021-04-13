class MarriagesController < ApplicationController
  before_action :authenticate

  def index
    @marriage = Marriage.find(session[:marriage])
    @ceremony = Ceremony.find_by(marriage_id: session[:marriage])
    @celebration = Celebration.find_by(marriage_id: session[:marriage])

    # GRAFICO DE INVITADOS QUE HAN CONFIRMADO Y LOS QUE NO LO HAN ECHO
    @invitados_confirmados = Marriage.find(session[:marriage]).marriage_inviteds.where(invited_confirm: false)
    @invitadosnoconfirmados = Marriage.find(session[:marriage]).marriage_inviteds.where(invited_confirm: true)
    @datos = [['invitados no confirmados', @invitados_confirmados.size],['invitados confirmados', @invitadosnoconfirmados.size]]

    #GRAFICO DE DIAS QUE FALTAN PARA CASARSE
    @ceremony_date = Marriage.find(session[:marriage]).ceremony.date
    @dias = [[(Date.parse(@ceremony_date) - Date.today).to_i]]
  end

  def show
    if params[:producto] == 'lista-invitados'
      @invited = Invited.new
      @inviteds_marriage = Invited.marriage(session[:marriage])
    elsif params[:producto] == 'invitaciones'
      @templates_invitations = TemplateInvitation.all
      @invitation_active = TemplateInvitation.active_invitation(session[:marriage])
    end
  end

  def new
    @marriage = Marriage.new
  end

  #crear matrimonio de parte de los administradores
  def create
    @marriage = Marriage.new(marriage_params)
    @marriage.save
    Ceremony.create(marriage_id: @marriage.id)
    Celebration.create(marriage_id: @marriage.id)
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
    params.require(:marriage).permit(:name1, :name2, :phone_name1, :phone_name2, :email_name1, :email_name2, :link_gift, :code_gift, :enterprise_gift, :password_digest)
  end

end
