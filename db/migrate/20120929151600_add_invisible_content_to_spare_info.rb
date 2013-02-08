class AddInvisibleContentToSpareInfo < ActiveRecord::Migration
  def change
    add_column :spare_infos, :invisible_content, :text
  end
end
