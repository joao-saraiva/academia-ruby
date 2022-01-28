class LessonDoubtComment < ApplicationRecord

    belongs_to :doubt, class_name: 'LessonDoubt', foreign_key: 'doubt_id'
    belongs_to :user, class_name: 'User'

    before_create :set_answered_to_false

    validates_presence_of :doubt_text

    def set_answered_to_false
        self.answered = false
    end
end
