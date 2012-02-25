class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.integer :creator_id
      t.integer :topic_id
      t.boolean :multichoice, :default => false

      t.timestamps
    end
  end
end
