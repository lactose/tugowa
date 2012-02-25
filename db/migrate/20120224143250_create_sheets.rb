class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.references :user
      t.integer :topic_id
      t.boolean :multichoice, :default => false

      t.timestamps
    end

    add_index :sheets, :user_id
  end
end
