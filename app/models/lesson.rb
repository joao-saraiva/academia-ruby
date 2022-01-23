class Lesson < ApplicationRecord
    validates_presence_of :name , :content

    has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
    has_many :users, through: :lesson_started_by_user
end
