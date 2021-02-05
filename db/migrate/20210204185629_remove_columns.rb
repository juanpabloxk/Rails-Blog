class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :category
  end
end
