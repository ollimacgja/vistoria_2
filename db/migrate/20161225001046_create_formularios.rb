class CreateFormularios < ActiveRecord::Migration
  def change
    create_table :formularios do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
