class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :quoted_from
      t.string :img_url

      t.timestamps
    end
  end
end
