class AddFileToFormularioP < ActiveRecord::Migration
  def change
    add_column :formulario_ps, :file, :string
  end
end
