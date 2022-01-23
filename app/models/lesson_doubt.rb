class LessonDoubt < ApplicationRecord

    belongs_to :lesson, class_name: 'Lesson'
end
