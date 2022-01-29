require 'rails_helper'

RSpec.describe "lessons_started_by_user/edit", type: :view do
  before(:each) do
    @lesson_started_by_user = assign(:lesson_started_by_user, LessonStartedByUser.create!(
      user_id: "",
      lesson_id: "",
      completed: false
    ))
  end

  it "renders the edit lesson_started_by_user form" do
    render

    assert_select "form[action=?][method=?]", lesson_started_by_user_path(@lesson_started_by_user), "post" do

      assert_select "input[name=?]", "lesson_started_by_user[user_id]"

      assert_select "input[name=?]", "lesson_started_by_user[lesson_id]"

      assert_select "input[name=?]", "lesson_started_by_user[completed]"
    end
  end
end
