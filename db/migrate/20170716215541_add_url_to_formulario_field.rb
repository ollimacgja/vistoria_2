class AddUrlToFormularioField < ActiveRecord::Migration
  def change
    add_column :formulario_fields, :url, :string
  end
end
