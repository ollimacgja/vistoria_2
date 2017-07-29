class AddFilialIdToFormulario < ActiveRecord::Migration
  def change
    add_column :formularios, :filial_id, :integer
    add_index :formularios, :filial_id
  end
end
