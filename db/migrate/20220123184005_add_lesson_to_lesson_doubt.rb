class AddLessonToLessonDoubt < ActiveRecord::Migration[6.1]
  def change
    add_column :lesson_doubts, :lesson_id, :bigint
  end
end
