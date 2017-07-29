class FormularioFieldsController < ApplicationController
  before_action :set_formulario_field, only: [:show, :edit, :update, :destroy]

  # GET /formulario_fields
  # GET /formulario_fields.json
  def index
    @formulario_fields = FormularioField.all
  end

  # GET /formulario_fields/1
  # GET /formulario_fields/1.json
  def show
  end

  # GET /formulario_fields/new
  def new
    if params[:id] != nil
       @form = Formulario.find(params[:id])
    end
    @formulario_field = FormularioField.new
    @fields = FieldType.all
    @formulario = Formulario.all
  end

  # GET /formulario_fields/1/edit
  def edit
  end

  # POST /formulario_fields
  # POST /formulario_fields.json
  def create
    parametros =formulario_field_params
    @formulario_field = FormularioField.new(parametros[0])

    if parametros [1] != nil
      tipo = parametros[1]
      label = parametros[2]
      rec = parametros[3]




      x=0
      for i in tipo

        form = FormularioField.new
        form.formulario_id =parametros[0]["formulario_id"]
        form.label = label[x.to_s]
        form.requirido = rec[x.to_s]
        form.field_type_id =tipo[x.to_s]
        form.save
        x+=1
      end

    end

    respond_to do |format|
      if @formulario_field.save
        format.html { redirect_to @formulario_field, notice: 'Formulario field was successfully created.' }
        format.json { render :show, status: :created, location: @formulario_field }
      else
        format.html { render :new }
        format.json { render json: @formulario_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulario_fields/1
  # PATCH/PUT /formulario_fields/1.json
  def update
    params = formulario_field_params
    respond_to do |format|
      if @formulario_field.update(params[0])
        format.html { redirect_to @formulario_field, notice: 'Formulario field was successfully updated.' }
        format.json { render :show, status: :ok, location: @formulario_field }
      else
        format.html { render :edit }
        format.json { render json: @formulario_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulario_fields/1
  # DELETE /formulario_fields/1.json
  def destroy
    @formulario_field.destroy
    respond_to do |format|
      format.html { redirect_to @formulario, notice: 'Formulario field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_formulario_field
    @formulario_field = FormularioField.find(params[:id])
    @formulario = @formulario_field.formulario
    @fields = FieldType.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def formulario_field_params
    if params[:tipo] != nil
      [params.require(:formulario_field).permit(:label, :formulario_id, :field_type_id, :requirido),
       params.require(:tipo).permit!,
       params.require(:label).permit!,
       params.require(:rec).permit!]
    else
      [params.require(:formulario_field).permit(:label, :formulario_id, :field_type_id, :requirido),
       nil,nil,nil]
    end
  end
end
