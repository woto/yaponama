class AddNotifiedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :notified, :boolean, :default => false
  end
end
