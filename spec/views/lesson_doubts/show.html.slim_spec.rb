require 'rails_helper'

RSpec.describe "lesson_doubts/show", type: :view do
  before(:each) do
    @lesson_doubt = assign(:lesson_doubt, LessonDoubt.create!(
      class_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
