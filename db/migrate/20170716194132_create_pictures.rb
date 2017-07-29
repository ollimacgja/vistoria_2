class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :answer, index: true, foreign_key: true
      t.string :file

      t.timestamps null: false
    end
  end
end
