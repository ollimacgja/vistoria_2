class DropUsuariosTable < ActiveRecord::Migration
  def change
    remove_foreign_key :formulario_ps, name: "fk_rails_a82b113d1e"
    drop_table :usuarios
  end
end
