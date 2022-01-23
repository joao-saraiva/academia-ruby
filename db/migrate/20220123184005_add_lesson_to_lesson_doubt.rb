class AddLessonToLessonDoubt < ActiveRecord::Migration[6.1]
  def change
    remove_column :lesson_doubts, :class_id
    add_column :lesson_doubts, :lesson_id, :bigint
  end
end
