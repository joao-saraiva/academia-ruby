require 'rails_helper'

RSpec.describe Lesson, type: :model do
  [:name , :content].each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end
  
  [:lessons_started_by_user, :users, :comments, :doubts].each do |model|
    it { is_expected.to have_many(model) }
  end

  [:name].each do |attribute|
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe '#content_formated_to_html' do 
    context 'When have content' do
      it 'Return content formated to html' do 
        lesson = FactoryBot.build(:lesson)

        expect(lesson.content_formated_to_html).to eq "<p>#{lesson.content}</p>"
      end
    end
    context 'When have no content' do
      it 'Return false' do 
        lesson = FactoryBot.build(:lesson, content: nil)

        expect(lesson.content_formated_to_html).to be_falsey
      end
    end
  end
end
