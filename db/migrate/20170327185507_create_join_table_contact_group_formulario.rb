class CreateJoinTableContactGroupFormulario < ActiveRecord::Migration
  def change
    create_join_table :contact_groups, :formularios do |t|
      # t.index [:contact_group_id, :formulario_id]
      # t.index [:formulario_id, :contact_group_id]
    end
  end
end
