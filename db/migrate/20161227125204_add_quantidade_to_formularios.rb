class AddQuantidadeToFormularios < ActiveRecord::Migration
  def change
    add_column :formularios, :quantidade,:integer
  end
end
