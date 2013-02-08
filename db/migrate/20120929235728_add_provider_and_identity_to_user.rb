class AddProviderAndIdentityToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :identity, :string
  end
end
