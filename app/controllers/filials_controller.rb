class FilialsController < ApplicationController
  before_action :set_filial, only: [:show, :edit, :update, :destroy]

  # GET /filials
  # GET /filials.json
  def index
    @filials = Filial.all
  end

  # GET /filials/1
  # GET /filials/1.json
  def show
  end

  # GET /filials/new
  def new
    @filial = Filial.new
  end

  # GET /filials/1/edit
  def edit
  end

  # POST /filials
  # POST /filials.json
  def create
    @filial = Filial.new(filial_params)

    respond_to do |format|
      if @filial.save
        format.html { redirect_to @filial, notice: 'Filial criada com sucesso.' }
        format.json { render :show, status: :created, location: @filial }
      else
        format.html { render :new }
        format.json { render json: @filial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filials/1
  # PATCH/PUT /filials/1.json
  def update
    respond_to do |format|
      if @filial.update(filial_params)
        format.html { redirect_to @filial, notice: 'Filial atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @filial }
      else
        format.html { render :edit }
        format.json { render json: @filial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filials/1
  # DELETE /filials/1.json
  def destroy
    @filial.destroy
    respond_to do |format|
      format.html { redirect_to filials_url, notice: 'Filial deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filial
      @filial = Filial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filial_params
      params.require(:filial).permit(:nome)
    end
end
