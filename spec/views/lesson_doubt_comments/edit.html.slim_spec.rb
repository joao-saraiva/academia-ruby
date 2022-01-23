require 'rails_helper'

RSpec.describe "lesson_doubt_comments/edit", type: :view do
  before(:each) do
    @lesson_doubt_comment = assign(:lesson_doubt_comment, LessonDoubtComment.create!(
      doubt_id: "",
      user_id: "",
      doubt_text: "MyText",
      answered: false
    ))
  end

  it "renders the edit lesson_doubt_comment form" do
    render

    assert_select "form[action=?][method=?]", lesson_doubt_comment_path(@lesson_doubt_comment), "post" do

      assert_select "input[name=?]", "lesson_doubt_comment[doubt_id]"

      assert_select "input[name=?]", "lesson_doubt_comment[user_id]"

      assert_select "textarea[name=?]", "lesson_doubt_comment[doubt_text]"

      assert_select "input[name=?]", "lesson_doubt_comment[answered]"
    end
  end
end
