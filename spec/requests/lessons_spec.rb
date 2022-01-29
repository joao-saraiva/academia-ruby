require 'rails_helper'

RSpec.describe "/lessons", type: :request do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:lesson)
  }

  let(:invalid_attributes) {
    { name: nil}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Lesson.create! valid_attributes
      get lessons_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      lesson = Lesson.create! valid_attributes
      get lesson_url(lesson)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_lesson_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    context 'when it was sucessful' do 
      it "render a successful response" do
        lesson = Lesson.create! valid_attributes
        get edit_lesson_url(lesson)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Lesson" do
        expect {
          post lessons_url, params: { lesson: valid_attributes }
        }.to change(Lesson, :count).by(1)
      end

      it "redirects to the created lesson" do
        post lessons_url, params: { lesson: valid_attributes }
        expect(response).to redirect_to(lesson_url(Lesson.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Lesson" do
        expect {
          post lessons_url, params: { lesson: invalid_attributes }
        }.to change(Lesson, :count).by(0)
      end

      it "render new" do
        post lessons_url, params: { lesson: invalid_attributes }
        expect(response).to render_template(:new)
      end

      context 'lesson name already exist' do 
        before do 
          FactoryBot.create(:lesson)
        end
        it 'does not create a new Lesson even with valids attributes' do
          expect {
            post lessons_url, params: { lesson: valid_attributes }
          }.to change(Lesson, :count).by(0)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Lesson-2' }
      }

      it "updates the requested lesson" do
        lesson = Lesson.create! valid_attributes
        patch lesson_url(lesson), params: { lesson: new_attributes }
        lesson.reload
        expect(lesson.name).to eq 'Lesson-2'
      end

      it "redirects to the lesson" do
        lesson = Lesson.create! valid_attributes
        patch lesson_url(lesson), params: { lesson: new_attributes }
        lesson.reload
        expect(response).to redirect_to(lesson_url(lesson))
      end
    end

    context "with itnvalid parameters" do
      it "render edit layout" do
        lesson = Lesson.create! valid_attributes
        patch lesson_url(lesson), params: { lesson: invalid_attributes }
        expect(response).to render_template(:edit)
      end

      context 'lesson name already exist' do 
        before do 
          FactoryBot.create(:lesson)
        end
        it 'does not create a new Lesson even with valids attributes' do
          expect {
            post lessons_url, params: { lesson: valid_attributes }
          }.to change(Lesson, :count).by(0)
        end
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested lesson" do
      lesson = Lesson.create! valid_attributes
      expect {
        delete lesson_url(lesson)
      }.to change(Lesson, :count).by(-1)
    end

    it "redirects to the lessons list" do
      lesson = Lesson.create! valid_attributes
      delete lesson_url(lesson)
      expect(response).to redirect_to(lessons_url)
    end
  end
end
