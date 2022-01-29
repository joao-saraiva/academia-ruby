class AddNameToLessonDoubt < ActiveRecord::Migration[6.1]
  def change
    add_column :lesson_doubts, :name, :string
  end
end
