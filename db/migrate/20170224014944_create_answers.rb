class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :formulario_field, index: true, foreign_key: true
      t.references :formulario_p, index: true, foreign_key: true
      t.string :valor
      t.string :file

      t.timestamps null: false
    end
  end
end
