class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :rounds
      t.datetime :start
      t.integer :sheet_id
      t.integer :team_a
      t.integer :team_b
      t.boolean :public
      t.integer :creator_id
      t.boolean :auto_assign

      t.timestamps
    end
  end
end
