class AddIndexToPairs < ActiveRecord::Migration
  def change
    add_index :pairs, :sheet_id
    add_index :sheets, :topic_id
  end
end
