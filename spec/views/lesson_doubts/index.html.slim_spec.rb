require 'rails_helper'

RSpec.describe "lesson_doubts/index", type: :view do
  before(:each) do
    assign(:lesson_doubts, [
      LessonDoubt.create!(
        class_id: ""
      ),
      LessonDoubt.create!(
        class_id: ""
      )
    ])
  end

  it "renders a list of lesson_doubts" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
