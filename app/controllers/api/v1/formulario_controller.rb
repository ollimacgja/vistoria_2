class Api::V1::FormularioController < Api::V1::BaseController

  before_action :authenticate_user
  before_action :set_fields, :only => [:create, :update]
  before_action :find_form, :only => :create
  before_action :find_form2, :only => :update


  def index
    @form = FormularioP.where(sync: false).last(20)
    render json: @form, status: 200
  end

  def create
    form_p = FormularioP.create!(user: @user, formulario: @form, created_at: DateTime.parse(params[:formulario][:created_at]))

    @fields.each do |params_field|
      form_field = FormularioField.find(params_field[:id])

      filled_form = form_p.answers.where(formulario_field: form_field).first_or_initialize

      if form_field.file_field?
        filled_form.file = params_field[:valor]
      elsif form_field.multi_picture_field?
        filled_form.pictures.new(file: params_field[:valor])
      else
        filled_form.valor = params_field[:valor]
      end

      filled_form.save!
    end
    render json: 'Formulário preenchido com sucesso'

    unless @form.contact_groups.blank?
      emails = @form.contact_groups.map { |e| e.destinos.map {|i| i.email } }.join(', ')
      unless emails.blank?
        EnviaEmailPreenchido.formulario(form_p, @form, emails).deliver_later
      end
    end

  end

  def update
    form = @form

    form.sync = formulario_params[:sync]

    unless @fields.blank?
      @fields.each do |field|
        update_field = Answer.find(field[:id])
        update_field.valor = field[:valor]
        update_field.save
      end
    end

    form.save

    if form.errors.blank?
      render json: form, status: 200
    else
      render json: { errors: form.errors }, status: 422
    end
  end


  private

  def formulario_params
    params.permit(:auth_token, :formulario_id, :sync, formulario: [:created_at], formulario_fields: [:id, :valor])
  end

#  def formulario_params
#    params.permit(:auth_token, :formulario_id, formulario_fields: [:id, :valor])
#  end

  def authenticate_user
    @user = User.find_by_auth_token(formulario_params[:auth_token])
    raise ActiveRecord::RecordNotFound, 'Usuário não encontrado' unless @user.present?
  end

  def find_form
    @form = Formulario.find_by_id(formulario_params[:formulario_id])
    raise ActiveRecord::RecordNotFound, 'Formulário não encontrado' unless @form.present?
  end

  def find_form2
    @form = FormularioP.find_by_id(formulario_params[:formulario_id])
    raise ActiveRecord::RecordNotFound, 'Respostas não encontradas' unless @form.present?
  end

  def set_fields
    @fields = formulario_params[:formulario_fields]
  end

end