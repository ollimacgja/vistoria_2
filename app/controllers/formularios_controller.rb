class FormulariosController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:checks]
  before_action :set_formulario, only: [:show, :edit, :update, :destroy, :detalhe]

  def form_enviado
    if params[:busca]
      #TODO inserir seach do elastic_search gem
      @answers = Answer.ransack(valor_cont: params[:busca]).result
      if @answers.any?
        @items = Array.new
        @answers.map { |e|
        @items << e.formulario_p_id
        }
        @form = FormularioP.where("id IN (?)", @items).paginate(:page => params[:page], :per_page => 20)
      else
        @form = nil
      end
      #@form = Post.search(params[:search]).order("created_at DESC")
    else
      @form = FormularioP.where("formulario_id = ?", params[:id]).order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
    end

    # +"<option value='1'>FOTO</option>"
    # +"<option value='2'>VÍDEO</option>"
    # +"<option value='3'>ASSINATURA</option>"
    # +"<option value='4'>COORDENADAS</option>"
    # +"<option value='5'>DATA</option>"
    # +"<option value='6'>DATA HORA</option>"
    # +"<option value='7'>TEXTO</option>"
    # +"<option value='8'>NÚMERO</option>"
    # +"<option value='9'>AUDIO</option>"
    # +"<option value='10'>CHECKBOX</option>"
    # +"<option value='11'>RADIOBOX</option>"
    # +"<option value='12'>ARQUIVO</option>"
    @tipo = ["","Foto","Vídeo","Assinatura","Coordenadas","Data","Data Hora","Texto","Número","Audio","Checkbox","RadioBox","Arquivo"]


  end

def checks
    form = FormularioP.find(params[:id].to_i(36))
    @answers = form.answers
    @files = form.answers.where("valor is null and file is not null")
    @texts = form.answers.where("valor is not null and file is null")
    @multi = @answers.multipictures
    @user = form.user
    @formP = form
    @filial = @user.filial

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "formulario_#{form.id}",
          header: {
            html: {
              template: 'layouts/_cabecalhopdf',
              locals: {}
            }
           },
           footer:  {   html: {   template:'layouts/_rodapepdf',         # use :template OR :url
                                  locals:  {}
           }
           }
      end
    end
  end

  def answers
    form = FormularioP.find(params[:id])
    @answers = form.answers
    @files = form.answers.where("valor is null and file is not null")
    @texts = form.answers.where("valor is not null and file is null")
    @multi = @answers.multipictures
    @user = form.user
    @formP = form
    @filial = @user.filial

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "formulario_#{form.id}",
          header: {
            html: {
              template: 'layouts/_cabecalhopdf',
              locals: {}
            }
           },
           footer:  {   html: {   template:'layouts/_rodapepdf',         # use :template OR :url
                                  locals:  {}
           }
           }
      end
    end
  end


  def indexp
    if params[:busca]
      #TODO inserir seach do elastic_search gem
      @answers = Answer.where("valor LIKE ?", "%#{params[:busca]}%")
      if @answers.any?
        @items = Array.new
        @answers.map { |e|
        @items << e.formulario_p_id
        }
        @form = FormularioP.where("id IN (?)", @items).paginate(:page => params[:page], :per_page => 30)
      else
        @form = nil
      end
    else
      @form = FormularioP.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
    end
    #@form = Formulario.joins(:formulario_ps).uniq
  end

  # GET /formularios
  # GET /formularios.json
  def index
    @formularios = Formulario.all
  end

  # GET /formularios/1
  # GET /formularios/1.json
  def show
    @fields = FormularioField.where "formulario_id =?", @formulario.id
  end

  # GET /formularios/new
  def new
    @formulario = Formulario.new
    @formulario_field = FormularioField.new
    @fields = FieldType.all
  end

  # GET /formularios/1/edit
  def edit
  end


  # POST /formularios
  # POST /formularios.json
  def create
    @formulario = Formulario.new(formulario_params)

    respond_to do |format|
      if @formulario.save
        format.html { redirect_to @formulario, notice: 'Formulario criado com sucesso.' }
        format.json { render :show, status: :created, location: @formulario }
      else
        format.html { render :new }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formularios/1
  # PATCH/PUT /formularios/1.json
  def update

    form = formulario_params

    respond_to do |format|
      if @formulario.update(formulario_params)
        format.html { redirect_to @formulario, notice: 'Formulario atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @formulario }
      else
        format.html { render :edit }
        format.json { render json: @formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formularios/1
  # DELETE /formularios/1.json
  def destroy
    @formulario.destroy
    respond_to do |format|
      format.html { redirect_to formularios_url, notice: 'Formulario deletado com sucesso.' }
      format.json { head :no_content }
    end
  end
  def detalhe
    @campos = FormularioField.where "formulario_id = ?", @formulario.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formulario
      @formulario = Formulario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formulario_params

     params.require(:formulario).permit(:nome, filial_ids: [], formulario_fields_attributes: [:id, :label, :field_type_id, :options, :url, :requirido, :_destroy], contact_group_ids: [])

      # if params[:tipo] != nil
      # [params.require(:formulario).permit(:nome),
      #  params.require(:tipo).permit!,
      #  params.require(:label).permit!,
      #  params.require(:rec).permit!]
      # else
      #   [params.require(:formulario).permit(:nome),nil,nil,nil]
      # end

    end
end
