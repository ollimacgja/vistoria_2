class ContactGroup < ActiveRecord::Base
    has_and_belongs_to_many :destinos
    has_and_belongs_to_many :formularios
end
