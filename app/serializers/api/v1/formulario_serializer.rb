class Api::V1::FormularioSerializer < ActiveModel::Serializer
  attributes :id,:nome, :filial_id

  has_many :formulario_fields
end
