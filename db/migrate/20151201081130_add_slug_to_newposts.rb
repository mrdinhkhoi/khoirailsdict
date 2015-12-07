class AddSlugToNewposts < ActiveRecord::Migration
  def change
    add_column :newposts, :slug, :string
  end
end
