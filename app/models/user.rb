class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
  has_many :lessons, through: :lessons_started_by_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates_presence_of :cpf, :password_confirmation

    def lessons_completed
      User.all.last.lessons.joins(:lessons_started_by_user).where(lessons_started_by_user: {completed: true})
    end

    def lessons_uncompleted
      User.all.last.lessons.joins(:lessons_started_by_user).where(lessons_started_by_user: {completed: false})
    end
end
