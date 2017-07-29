class CreateJoinTableContactGroupDestino < ActiveRecord::Migration
  def change
    create_join_table :contact_groups, :destinos do |t|
      # t.index [:contact_group_id, :destino_id]
      # t.index [:destino_id, :contact_group_id]
    end
  end
end
 