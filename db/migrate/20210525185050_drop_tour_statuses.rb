class DropTourStatuses < ActiveRecord::Migration[6.0]
  def change
    drop_table :tour_statuses
  end
end
