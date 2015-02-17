class RemoveTitleFromReplies < ActiveRecord::Migration
  def change
    remove_column :replies, :title
  end
end
