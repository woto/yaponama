class AddRobotsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :robots, :string
  end
end
