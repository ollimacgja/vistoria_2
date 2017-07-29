class CreateDestinos < ActiveRecord::Migration
  def change
    create_table :destinos do |t|
      t.string :nome
      t.string :email
      t.string :celular

      t.timestamps null: false
    end
  end
end
