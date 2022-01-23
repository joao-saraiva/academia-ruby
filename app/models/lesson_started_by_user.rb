class LessonStartedByUser < ApplicationRecord
    validates_presence_of :user_id, :lesson_id

    belongs_to :user, class_name: 'User'
    belongs_to :lesson, class_name: 'Lesson'

    before_create :set_completed_to_false

    def set_completed_to_false
        self.completed = false
    end
end
