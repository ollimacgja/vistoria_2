class Api::V1::FormularioFieldSerializer < ActiveModel::Serializer
  attributes :id, :label, :field_type_id, :field_type_name, :requirido
  attribute :options, if: :with_options?
  attribute :xml_field, if: :with_url?

  def field_type_name
    object.field_type.nome
  end

  def with_options?
    object.options.present?
  end

  def with_url?
    object.url.present?
  end

  def xml_field
    object.xml_field
  end
end
