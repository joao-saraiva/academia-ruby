require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      name: "MyString",
      content: "MyText"
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input[name=?]", "lesson[name]"

      assert_select "textarea[name=?]", "lesson[content]"
    end
  end
end
