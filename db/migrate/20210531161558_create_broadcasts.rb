class CreateBroadcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcasts do |t|
      t.string :name
      t.references :broadcastable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
