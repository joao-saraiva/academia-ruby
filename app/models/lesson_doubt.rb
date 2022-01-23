class LessonDoubt < ApplicationRecord

    belongs_to :lesson, class_name: 'Lesson'

    has_many :comments, class_name: 'LessonDoubtComment', foreign_key: :doubt_id
end
