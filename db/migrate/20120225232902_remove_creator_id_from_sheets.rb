class RemoveCreatorIdFromSheets < ActiveRecord::Migration
  def up
    remove_column :sheets, :creator_id
  end

  def down
    add_column :sheets, :user, :references
  end
end
