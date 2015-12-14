class RenameNewpostsTableToPosts < ActiveRecord::Migration
  def change
     rename_table :newposts, :posts
  end
end
