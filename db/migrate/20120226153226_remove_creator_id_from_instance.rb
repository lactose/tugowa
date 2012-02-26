class RemoveCreatorIdFromInstance < ActiveRecord::Migration
  def up
    remove_column :instances, :creator_id
  end

  def down
    add_column :instances, :user_id, :integer

    add_index :instances, :user_id
  end
end
