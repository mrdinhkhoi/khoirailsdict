class CreateNewposts < ActiveRecord::Migration
  def change
    create_table :newposts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :keyword
      t.integer :count

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :newposts
  end
end
