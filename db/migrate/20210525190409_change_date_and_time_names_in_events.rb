class ChangeDateAndTimeNamesInEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date, :date
    remove_column :events, :time, :time
    add_column :events, :show_start_at, :datetime
  end
end
