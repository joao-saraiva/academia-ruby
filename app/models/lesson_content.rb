class LessonContent < ApplicationRecord
  belongs_to :lesson
  validates_presence_of :lesson_id , :content
end
