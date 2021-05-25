class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :artist_name
      t.string :logo_url

      t.timestamps
    end
  end
end
