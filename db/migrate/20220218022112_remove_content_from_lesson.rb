class RemoveContentFromLesson < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :content, :text
  end
end
