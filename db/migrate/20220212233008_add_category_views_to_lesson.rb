class AddCategoryViewsToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :category, :integer
    add_column :lessons, :views, :bigint
  end
end
