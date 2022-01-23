require 'rails_helper'

RSpec.describe User, type: :model do
  [:email, :password, :password_confirmation, :cpf].each do |attribute| 
    it { is_expected.to  validate_presence_of(attribute) }
  end

  describe '#lessons_completed' do
    context 'when have lessons completed' do 
      it 'return a collection of lessons completed by the user' do 
        user = FactoryBot.create(:user, :with_lesson)

        lesson = user.lessons_started_by_user.last
        lesson.update_attribute(:completed, true)
        lesson.reload

        expect(user.lessons_completed).to include user.lessons.last
      end
    end

    context 'when not have lessons completed' do
      it 'return an empty collection' do
        user = FactoryBot.create(:user, :with_lesson)

        lesson = user.lessons_started_by_user.last
        lesson.update_attribute(:completed, false)
        lesson.reload

        expect(user.lessons_completed.empty?).to be_truthy
      end
    end
  end

  describe '#lessons_uncompleted' do 
    context 'when have lessons uncompleted' do 
      it 'return a collection of lessons uncompleted by the user' do 
        user = FactoryBot.create(:user, :with_lesson)

        lesson = user.lessons_started_by_user.last
        lesson.update_attribute(:completed, false)
        lesson.reload

        expect(user.lessons_uncompleted).to include user.lessons.last
      end
    end

    context 'when not have lessons uncompleted' do
      it 'return an empty collection' do
        user = FactoryBot.create(:user, :with_lesson)

        lesson = user.lessons_started_by_user.last
        lesson.update_attribute(:completed, true)
        lesson.reload

        expect(user.lessons_uncompleted.empty?).to be_truthy
      end
    end
  end
end
