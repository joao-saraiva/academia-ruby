require 'rails_helper'

RSpec.describe "lessons_started_by_user/show", type: :view do
  before(:each) do
    @lesson_started_by_user = assign(:lesson_started_by_user, LessonStartedByUser.create!(
      user_id: "",
      lesson_id: "",
      completed: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
