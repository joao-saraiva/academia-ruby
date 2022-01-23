class CreateLessonsStartedByUser < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons_started_by_user do |t|
      t.bigint :user_id
      t.bigint :lesson_id
      t.boolean :completed

      t.timestamps
    end
  end
end
