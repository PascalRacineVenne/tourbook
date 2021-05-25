class CreateTourMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_members do |t|
      t.string :job_title
      t.boolean :administrator, default: false
      t.references :tour, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
