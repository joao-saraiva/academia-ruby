require "rails_helper"

RSpec.describe LessonDoubtCommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lesson_doubt_comments").to route_to("lesson_doubt_comments#index")
    end

    it "routes to #new" do
      expect(get: "/lesson_doubt_comments/new").to route_to("lesson_doubt_comments#new")
    end

    it "routes to #show" do
      expect(get: "/lesson_doubt_comments/1").to route_to("lesson_doubt_comments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lesson_doubt_comments/1/edit").to route_to("lesson_doubt_comments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lesson_doubt_comments").to route_to("lesson_doubt_comments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lesson_doubt_comments/1").to route_to("lesson_doubt_comments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lesson_doubt_comments/1").to route_to("lesson_doubt_comments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lesson_doubt_comments/1").to route_to("lesson_doubt_comments#destroy", id: "1")
    end
  end
end
