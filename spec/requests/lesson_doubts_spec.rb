 require 'rails_helper'
RSpec.describe "/lesson_doubts", type: :request do
  
  # LessonDoubt. As you add validations to LessonDoubt, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:lesson_doubt)
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      LessonDoubt.create! valid_attributes
      get lesson_doubts_url
      expect(response).to be_successful
    end
  end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     lesson_doubt = LessonDoubt.create! valid_attributes
  #     get lesson_doubt_url(lesson_doubt)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /new" do
    it "renders a successful response" do
      lesson = FactoryBot.create(:lesson)
      get new_doubt_by_lesson_path(lesson)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      lesson_doubt = LessonDoubt.create! valid_attributes
      get edit_lesson_doubt_url(lesson_doubt)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new LessonDoubt" do
        expect {
          post lesson_doubts_url, params: { lesson_doubt: valid_attributes }
        }.to change(LessonDoubt, :count).by(1)
      end

      it "redirects to the created lesson_doubt" do
        post lesson_doubts_url, params: { lesson_doubt: valid_attributes }
        expect(response).to redirect_to(lesson_doubt_url(LessonDoubt.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new LessonDoubt" do
        expect {
          post lesson_doubts_url, params: { lesson_doubt: invalid_attributes }
        }.to change(LessonDoubt, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post lesson_doubts_url, params: { lesson_doubt: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'New name' }
      }

      it "updates the requested lesson_doubt" do
        lesson_doubt = LessonDoubt.create! valid_attributes
        patch lesson_doubt_url(lesson_doubt), params: { lesson_doubt: new_attributes }
        expect(lesson_doubt.reload.name).to eq 'New name'
      end

      it "redirects to the lesson_doubt" do
        lesson_doubt = LessonDoubt.create! valid_attributes
        patch lesson_doubt_url(lesson_doubt), params: { lesson_doubt: new_attributes }
        lesson_doubt.reload
        expect(response).to redirect_to(lesson_doubt_url(lesson_doubt))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        lesson_doubt = LessonDoubt.create! valid_attributes
        patch lesson_doubt_url(lesson_doubt), params: { lesson_doubt: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested lesson_doubt" do
      lesson_doubt = LessonDoubt.create! valid_attributes
      expect {
        delete lesson_doubt_url(lesson_doubt)
      }.to change(LessonDoubt, :count).by(-1)
    end

    it "redirects to the lesson_doubts list" do
      lesson_doubt = LessonDoubt.create! valid_attributes
      delete lesson_doubt_url(lesson_doubt)
      expect(response).to redirect_to(lesson_doubts_url)
    end
  end

  describe 'POST /post_comment' do 
    context 'When post' do 
      let(:comment_valid){
        FactoryBot.attributes_for(:lesson_doubt_comment)
      }

      it 'Create a new LessonDoubtComment ' do
        expect{
          post post_comment_path(), params: { lesson_doubt_comment: comment_valid }
        }.to change(LessonDoubtComment, :count).by(1)
      end

      it 'Redirect to show' do 
        post post_comment_path(), params: { lesson_doubt_comment: comment_valid }
        expect(response).to redirect_to(lesson_doubt_url(assigns[:lesson_doubt].lesson.id - 1))
      end
    end

    context 'When not post' do 
      let(:comment_invalid){
        { description: nil}
      }
      it 'Not Create a new LessonDoubtComment' do 
        expect{
          post post_comment_path(), params: { lesson_doubt_comment: comment_invalid }
        }.to change(LessonDoubtComment, :count).by(0)
      end

      it 'Render template show' do 
        post post_comment_path(), params: { lesson_doubt_comment: comment_invalid }
        expect(response).to render_template(:show)
      end
    end
  end

end
