class Lesson < ApplicationRecord
    validates_presence_of :name , :content
    validates_uniqueness_of :name

    has_one :doubt, class_name: 'LessonDoubt'

    has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
    has_many :users, through: :lesson_started_by_user, class_name: 'User'
    has_many :comments, through: :doubt, class_name: 'LessonDoubtComment'

    after_create :create_doubt

    def create_doubt
        LessonDoubt.create(lesson_id: self.id)
    end

    def content_formated_to_html 
        "<p>#{content}</p>".html_safe
    end
end
