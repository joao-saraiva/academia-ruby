class CreateLessonDoubtComments < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_doubt_comments do |t|
      t.bigint :doubt_id
      t.bigint :user_id
      t.text :doubt_text
      t.boolean :answered

      t.timestamps
    end
  end
end
