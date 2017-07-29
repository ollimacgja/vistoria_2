class AddOptionsToFormularioFields < ActiveRecord::Migration
  def change
    add_column :formulario_fields, :options, :string
  end
end
