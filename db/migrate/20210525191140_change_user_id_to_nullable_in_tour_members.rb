class ChangeUserIdToNullableInTourMembers < ActiveRecord::Migration[6.0]
  def change
    change_column :tour_members, :user_id, :bigint, null: true
  end
end
