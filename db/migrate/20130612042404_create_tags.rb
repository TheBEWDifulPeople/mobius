class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :post, index: true
      t.string :tag

      t.timestamps
    end
  end
end
