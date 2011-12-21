class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.integer :user_id
      t.string :session_id
      t.string :catalog_number
      t.string :manufacturer

      t.timestamps
    end
  end
end
