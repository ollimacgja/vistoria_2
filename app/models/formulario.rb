class Formulario < ActiveRecord::Base
  has_many :filial_formularios, dependent: :destroy
  has_many :filials, through: :filial_formularios

  has_many :formulario_fields
  has_and_belongs_to_many :contact_groups
  has_many :formulario_ps, dependent: :destroy
  accepts_nested_attributes_for :formulario_fields, allow_destroy: true, :reject_if => lambda { |a| a[:label].blank? }
end
