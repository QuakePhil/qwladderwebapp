class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :server
      t.integer :port
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
