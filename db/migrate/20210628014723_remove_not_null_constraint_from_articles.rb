class RemoveNotNullConstraintFromArticles < ActiveRecord::Migration[6.1]
  def change
    change_column_null :articles, :category_id, true
  end
end
