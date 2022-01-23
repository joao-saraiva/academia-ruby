require "rails_helper"

RSpec.describe LessonDoubtsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lesson_doubts").to route_to("lesson_doubts#index")
    end

    it "routes to #new" do
      expect(get: "/lesson_doubts/new").to route_to("lesson_doubts#new")
    end

    it "routes to #show" do
      expect(get: "/lesson_doubts/1").to route_to("lesson_doubts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lesson_doubts/1/edit").to route_to("lesson_doubts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lesson_doubts").to route_to("lesson_doubts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lesson_doubts/1").to route_to("lesson_doubts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lesson_doubts/1").to route_to("lesson_doubts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lesson_doubts/1").to route_to("lesson_doubts#destroy", id: "1")
    end
  end
end
