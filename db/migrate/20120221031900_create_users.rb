class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :nick
      t.integer :answers_r
      t.integer :answers_w
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
