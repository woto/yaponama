class AddProbabilityToWish < ActiveRecord::Migration
  def change
    add_column :wishes, :probability, :string
  end
end
