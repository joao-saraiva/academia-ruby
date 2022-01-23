require 'rails_helper'

RSpec.describe "lessons_started_by_user/new", type: :view do
  before(:each) do
    assign(:lesson_started_by_user, LessonStartedByUser.new(
      user_id: "",
      lesson_id: "",
      completed: false
    ))
  end

  it "renders new lesson_started_by_user form" do
    render

    assert_select "form[action=?][method=?]", lessons_started_by_user_path, "post" do

      assert_select "input[name=?]", "lesson_started_by_user[user_id]"

      assert_select "input[name=?]", "lesson_started_by_user[lesson_id]"

      assert_select "input[name=?]", "lesson_started_by_user[completed]"
    end
  end
end
