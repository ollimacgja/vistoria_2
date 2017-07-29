class LogosController < ApplicationController
  before_action :set_logo, only: [:index, :update]

  def index
  end

  def update
    if @logo.update(logo_params)
      redirect_to logos_path, notice: 'Logo atualizado com sucesso.'
    else
      render :index
    end
  end

  private
    def set_logo
      @logo = Logo.last
    end

    def logo_params
      params.require(:logo).permit(:image)
    end
end
