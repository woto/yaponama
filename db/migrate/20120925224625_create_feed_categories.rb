class CreateFeedCategories < ActiveRecord::Migration
  def change
    create_table :feed_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
