require 'rails_helper'

RSpec.describe LessonDoubt, type: :model do
  it { is_expected.to belong_to(:lesson) }

  it { is_expected.to have_many(:comments) }
end
