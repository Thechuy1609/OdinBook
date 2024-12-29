class AddColumnToFollows < ActiveRecord::Migration[8.0]
  def change
    add_column :follows, :followees_count, :integer, :default => 0
  end  
end
