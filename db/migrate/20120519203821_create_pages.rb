class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :path
      t.text :default_content
      t.text :mobile_content
      t.text :keyword
      t.text :description

      t.timestamps
    end
  end
end
