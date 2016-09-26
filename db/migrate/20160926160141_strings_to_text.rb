class StringsToText < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :content, :text, :limit => nil
    change_column :comments, :content, :text, :limit => nil
  end
end
