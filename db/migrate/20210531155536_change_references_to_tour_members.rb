class ChangeReferencesToTourMembers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tour_members, :tour, null: false, foreign_key: true
    add_reference :tour_members, :event, null: false, foreign_key: true
  end
end
