require 'rails_helper'

RSpec.describe LessonDoubt, type: :model do
  it { is_expected.to belong_to(:lesson) }

  it { is_expected.to have_many(:comments) }

  [:name, :description].each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end
end
