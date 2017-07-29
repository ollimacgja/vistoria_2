class CreateFormularioFields < ActiveRecord::Migration
  def change
    create_table :formulario_fields do |t|
      t.string :label
      t.integer :formulario_id
      t.integer :field_type_id
      t.integer :requirido

      t.timestamps null: false
    end
  end
end
