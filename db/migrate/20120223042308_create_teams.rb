class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :wins
      t.integer :losses
      t.integer :correct
      t.integer :incorrect
      t.integer :creator_id
      t.string :name

      t.timestamps
    end
  end
end
