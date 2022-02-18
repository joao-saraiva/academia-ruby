# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
    # inflect.plural /^(ox)$/i, '\1en'
    # inflect.singular /^(ox)en/i, '\1'
    # inflect.irregular 'person', 'people'
    # inflect.uncountable %w( fish sheep )

    inflect.irregular('LessonStartedByUser', 'LessonsStartedByUser')
    inflect.irregular('lesson_started_by_user', 'lessons_started_by_user')

    inflect.irregular('LessonDoubt', 'LessonDoubts')
    inflect.irregular('lesson_doubt', 'lesson_doubts')

    inflect.irregular('LessonDoubtComment', 'LessonDoubtComments')
    inflect.irregular('lesson_doubt_comment', 'lesson_doubt_comments')
    inflect.irregular('category', 'categories')
    inflect.irregular('LessonContent', 'LessonContents')
    inflect.irregular('lessson_content', 'lesson_contents')
end
