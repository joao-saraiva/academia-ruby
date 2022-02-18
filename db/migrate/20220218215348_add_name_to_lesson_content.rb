class AddNameToLessonContent < ActiveRecord::Migration[6.1]
  def change
    add_column :lesson_contents, :name, :string
  end
end
