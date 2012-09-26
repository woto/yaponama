class CreateFeedElements < ActiveRecord::Migration
  def change
    create_table :feed_elements do |t|
      t.string :title
      t.string :robots
      t.text :keywords
      t.text :description
      t.text :default_content
      t.text :mobile_content
      t.references :feed_category

      t.timestamps
    end
    add_index :feed_elements, :feed_category_id
  end
end
