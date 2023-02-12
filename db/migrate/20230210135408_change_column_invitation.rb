class ChangeColumnInvitation < ActiveRecord::Migration[7.0]
  def change
    change_column_default :invitations, :accepted, :false
  end
end
