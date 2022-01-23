require 'rails_helper'

RSpec.describe "lessons_started_by_user/index", type: :view do
  before(:each) do
    assign(:lessons_started_by_user, [
      LessonStartedByUser.create!(
        user_id: "",
        lesson_id: "",
        completed: false
      ),
      LessonStartedByUser.create!(
        user_id: "",
        lesson_id: "",
        completed: false
      )
    ])
  end

  it "renders a list of lessons_started_by_user" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
