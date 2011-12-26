class AddCountInWishesToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :count_in_wishes, :integer, :default => 1
  end
end
