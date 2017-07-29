class FilialFormulario < ActiveRecord::Base
  belongs_to :formulario
  belongs_to :filial
end
