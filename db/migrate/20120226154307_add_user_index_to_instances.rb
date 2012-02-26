class AddUserIndexToInstances < ActiveRecord::Migration
  def change
    add_index :instances, :user_id
    add_index :instances, :sheet_id
  end
end
