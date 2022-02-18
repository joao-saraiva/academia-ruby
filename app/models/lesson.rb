class Lesson < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :lessons_started_by_user, class_name: 'LessonStartedByUser'
  has_many :users, through: :lesson_started_by_user, class_name: 'User'
  has_many :doubts, class_name: 'LessonDoubt'
  has_many :comments, through: :doubt, class_name: 'LessonDoubtComment'
  has_many :lesson_contents, class_name: 'LessonContent'

  enum category: [ :ruby, :html, :css, :javascript ]

  def content_formated_to_html
      self.content.present? ? "<p>#{self.content}</p>".html_safe : false
  end

  def after_acess
    self.views = self.views.to_f + 1
    self.save!
  end

  def formatted_views_text
    if self.views.to_i < 1000
      return self.views.to_i.to_s[0]
    elsif self.views.to_i >= 1000 && self.views.to_i <= 9999
      return "#{self.views.to_i.to_s[0]}#{self.views.to_i.to_s[1]} K"
    elsif self.views.to_i >= 10000 && self.views.to_i < 99999
      return "#{self.views.to_i.to_s[0]} K"
    end
  end
end
