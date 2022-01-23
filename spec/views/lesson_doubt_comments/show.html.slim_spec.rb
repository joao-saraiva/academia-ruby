require 'rails_helper'

RSpec.describe "lesson_doubt_comments/show", type: :view do
  before(:each) do
    @lesson_doubt_comment = assign(:lesson_doubt_comment, LessonDoubtComment.create!(
      doubt_id: "",
      user_id: "",
      doubt_text: "MyText",
      answered: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
