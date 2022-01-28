class AddDescriptionToLessonDoubt < ActiveRecord::Migration[6.1]
  def change
    add_column :lesson_doubts, :description, :text
  end
end
