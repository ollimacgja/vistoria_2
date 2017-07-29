class MigrateFormulariosFiliaisToNewModel < ActiveRecord::Migration
  def change
    Formulario.all.each do |form|
      FilialFormulario.where(filial_id: form.filial_id, formulario_id: form.id).first_or_create
    end

  end
end
