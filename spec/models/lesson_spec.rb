require 'rails_helper'

RSpec.describe Lesson, type: :model do
  [:name , :content].each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end
  
  [:lessons_started_by_user, :users, :comments].each do |model|
    it { is_expected.to have_many(model) }
  end

  it { is_expected.to have_one(:doubt) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
