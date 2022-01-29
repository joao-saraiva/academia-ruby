require 'rails_helper'

RSpec.describe "lesson_doubts/edit", type: :view do
  before(:each) do
    @lesson_doubt = assign(:lesson_doubt, LessonDoubt.create!(
      class_id: ""
    ))
  end

  it "renders the edit lesson_doubt form" do
    render

    assert_select "form[action=?][method=?]", lesson_doubt_path(@lesson_doubt), "post" do

      assert_select "input[name=?]", "lesson_doubt[class_id]"
    end
  end
end
