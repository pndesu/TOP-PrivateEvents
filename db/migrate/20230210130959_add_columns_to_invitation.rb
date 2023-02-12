class AddColumnsToInvitation < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :requested, :boolean, default: 0, null: false
    add_column :invitations, :accepted, :boolean, default: 1, null: false
    add_column :invitations, :declined, :boolean, default: 0, null: false
  end
end
