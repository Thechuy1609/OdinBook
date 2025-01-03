class AddCountTolikes < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :likers_count, :integer, :default => 0
  end
end
