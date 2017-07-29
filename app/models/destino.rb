class Destino < ActiveRecord::Base
    has_and_belongs_to_many :contact_groups
end
