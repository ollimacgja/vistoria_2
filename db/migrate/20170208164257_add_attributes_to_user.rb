class AddAttributesToUser < ActiveRecord::Migration
  def change
    rename_column :users, :name, :nome
    add_column :users, :filial_id, :integer
    add_column :users, :tipo, :integer

    add_index :users, :filial_id
  end
end
