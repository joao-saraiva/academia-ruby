class Lesson < ApplicationRecord
    validates_presence_of :name , :content
    validates_uniqueness_of :name

    has_one :doubt, class_name: 'LessonDoubt'

    has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
    has_many :users, through: :lesson_started_by_user, class_name: 'User'
    has_many :comments, through: :doubt, class_name: 'LessonDoubtComment'

    

end
