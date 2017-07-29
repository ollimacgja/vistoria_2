class ChangeAllTablesReferenceToUsuarios < ActiveRecord::Migration
  def change
    rename_column :formulario_ps, :usuario_id, :user_id
  end
end
