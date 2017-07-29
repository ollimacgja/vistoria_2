class DeleteAllFormularioP < ActiveRecord::Migration
  def change
    FormularioP.destroy_all
  end
end
