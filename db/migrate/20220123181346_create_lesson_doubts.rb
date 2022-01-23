class CreateLessonDoubts < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_doubts do |t|
      t.bigint :class_id

      t.timestamps
    end
  end
end
