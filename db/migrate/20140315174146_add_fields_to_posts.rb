class AddFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :tags, :string
  end
end
