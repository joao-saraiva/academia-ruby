require 'rails_helper'

RSpec.describe "lesson_doubt_comments/new", type: :view do
  before(:each) do
    assign(:lesson_doubt_comment, LessonDoubtComment.new(
      doubt_id: "",
      user_id: "",
      doubt_text: "MyText",
      answered: false
    ))
  end

  it "renders new lesson_doubt_comment form" do
    render

    assert_select "form[action=?][method=?]", lesson_doubt_comments_path, "post" do

      assert_select "input[name=?]", "lesson_doubt_comment[doubt_id]"

      assert_select "input[name=?]", "lesson_doubt_comment[user_id]"

      assert_select "textarea[name=?]", "lesson_doubt_comment[doubt_text]"

      assert_select "input[name=?]", "lesson_doubt_comment[answered]"
    end
  end
end
