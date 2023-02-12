class RemoveColumnInvitation < ActiveRecord::Migration[7.0]
  def change
    remove_column :invitations, :declined
  end
end
