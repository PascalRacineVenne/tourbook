class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.text :schedule
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
