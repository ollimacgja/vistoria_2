class CreateFilialFormularios < ActiveRecord::Migration
  def change
    create_table :filial_formularios do |t|
      t.references :formulario, index: true, foreign_key: true
      t.references :filial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
