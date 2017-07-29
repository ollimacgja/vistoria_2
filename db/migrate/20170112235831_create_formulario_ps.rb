class CreateFormularioPs < ActiveRecord::Migration
  def change
    create_table :formulario_ps do |t|
      t.string :form_id
      t.belongs_to :formulario, index: true, foreign_key: true
      t.belongs_to :formulario_field, index: true, foreign_key: true
      t.belongs_to :usuario, index: true, foreign_key: true
      t.string :valor

      t.timestamps null: false
    end
  end
end
