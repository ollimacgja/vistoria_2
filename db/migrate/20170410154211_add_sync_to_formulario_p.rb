class AddSyncToFormularioP < ActiveRecord::Migration
  def change
    add_column :formulario_ps, :sync, :boolean, :default => false
  end
end
