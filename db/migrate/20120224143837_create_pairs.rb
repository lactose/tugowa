class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :question
      t.string :answer
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d
      t.integer :sheet_id

      t.timestamps
    end
  end
end
