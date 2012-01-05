class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.boolean :notified, :default => false
      t.belongs_to :request
      t.belongs_to :user

      t.timestamps
    end
  end
end
