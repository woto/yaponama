class CreateCallbackRequests < ActiveRecord::Migration
  def change
    create_table :callback_requests do |t|
      t.string :phone
      t.text :notes

      t.timestamps
    end
  end
end
