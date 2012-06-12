class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :url
      t.text :search_address_logic
      t.text :template_to_search
      t.datetime :last_date_check
      t.datetime :last_successful_date_check
      t.integer :fail_sequence_counter, :default => 0
      t.string :notes

      t.timestamps
    end
  end
end
