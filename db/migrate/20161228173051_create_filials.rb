class CreateFilials < ActiveRecord::Migration
  def change
    create_table :filials do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
