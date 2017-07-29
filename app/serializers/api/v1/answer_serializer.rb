class Api::V1::AnswerSerializer < ActiveModel::Serializer
attributes :id, :campo, :valor, :file

def campo
    object.formulario_field.label
end

end

