require 'rails_helper'

RSpec.describe LessonDoubtComment, type: :model do
  [:doubt, :user].each do |model|
    it { is_expected.to belong_to(model) }
  end

  [:doubt_text, :user_id, :doubt_id].each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end

  #after create methods
  describe '#set_answered_to_false' do 
    it 'should put answered to false' do 
      doubt_comment = FactoryBot.create(:lesson_doubt_comment, answered: true)
      expect(doubt_comment.answered).to be_falsey
    end
  end
end
