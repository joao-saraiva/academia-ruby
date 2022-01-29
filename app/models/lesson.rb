class Lesson < ApplicationRecord
    validates_presence_of :name , :content
    validates_uniqueness_of :name

    has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
    has_many :users, through: :lesson_started_by_user, class_name: 'User'
    has_many :doubts, class_name: 'LessonDoubt'
    has_many :comments, through: :doubt, class_name: 'LessonDoubtComment'

    def content_formated_to_html
        self.content.present? ? "<p>#{self.content}</p>".html_safe : false
    end
end
