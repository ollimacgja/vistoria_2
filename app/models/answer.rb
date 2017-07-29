class Answer < ActiveRecord::Base
  mount_base64_uploader :file, FileUploader

  belongs_to :formulario_field
  belongs_to :formulario_p

  has_many :pictures, dependent: :destroy

  scope :multipictures, -> { joins(:formulario_field).where('formulario_fields.field_type_id = ?', FieldType.find_by(nome: 'MultiPictures').id) }
end
