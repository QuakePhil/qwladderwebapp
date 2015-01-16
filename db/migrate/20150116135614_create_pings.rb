class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.string :server
      t.string :player
      t.integer :ping

      t.timestamps null: false
    end
  end
end
