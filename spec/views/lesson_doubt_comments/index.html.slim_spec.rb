require 'rails_helper'

RSpec.describe "lesson_doubt_comments/index", type: :view do
  before(:each) do
    assign(:lesson_doubt_comments, [
      LessonDoubtComment.create!(
        doubt_id: "",
        user_id: "",
        doubt_text: "MyText",
        answered: false
      ),
      LessonDoubtComment.create!(
        doubt_id: "",
        user_id: "",
        doubt_text: "MyText",
        answered: false
      )
    ])
  end

  it "renders a list of lesson_doubt_comments" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
