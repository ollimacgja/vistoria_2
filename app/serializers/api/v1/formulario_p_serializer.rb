class Api::V1::FormularioPSerializer < ActiveModel::Serializer
attributes :id, :tipo, :vistoriador, :sync, :filial

  def tipo
    object.formulario.nome  
  end

  def vistoriador
    object.user.nome
  end

  def filial
    object.user.filial.nome
  end

  has_many :answers

end


