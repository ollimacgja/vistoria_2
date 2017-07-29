class FormularioP < ActiveRecord::Base

  has_many :answers, dependent: :destroy
  # belongs_to :formulario_field
  belongs_to :formulario
  belongs_to :filial
  belongs_to :user


def method_name
  id = 12345
  short = id.to_s(36)
  puts short
  #=> 9ix
  
  puts short.to_i(36)
  #=> 12345  
end

 
end
