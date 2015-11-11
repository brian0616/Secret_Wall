class DropCategoriesModifySecrets < ActiveRecord::Migration
  def change
  	remove_column :secrets, :category_id
  	add_column :secrets, :category, :string
  end
end
