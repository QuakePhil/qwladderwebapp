class CreateLadders < ActiveRecord::Migration
  def change
    create_table :ladders do |t|
      t.string :ladder
      t.string :player
      t.string :status
      t.integer :result

      t.timestamps null: false
    end
  end
end
