require 'rails_helper'

RSpec.describe "lesson_doubts/new", type: :view do
  before(:each) do
    assign(:lesson_doubt, LessonDoubt.new(
      class_id: ""
    ))
  end

  it "renders new lesson_doubt form" do
    render

    assert_select "form[action=?][method=?]", lesson_doubts_path, "post" do

      assert_select "input[name=?]", "lesson_doubt[class_id]"
    end
  end
end
