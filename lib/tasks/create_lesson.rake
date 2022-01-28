namespace :create_lesson do
  desc "Create the first lesson"
  task lesson_1: :environment do
    Lesson.find_or_create_by(name: 'Introduction to ruby', content: 'this is just a test to display ')
  end

end
