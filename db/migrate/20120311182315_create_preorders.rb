class CreatePreorders < ActiveRecord::Migration
  def change
    create_table :preorders do |t|
      t.string :email

      t.timestamps
    end
    add_index :preorders, :email, :unique => true

  end
end
