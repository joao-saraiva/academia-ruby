class CreateLessonContents < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_contents do |t|
      t.bigint :lesson_id
      t.text :content

      t.timestamps
    end
  end
end
