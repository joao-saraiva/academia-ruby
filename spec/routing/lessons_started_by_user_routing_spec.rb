require "rails_helper"

RSpec.describe LessonsStartedByUserController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lessons_started_by_user").to route_to("lessons_started_by_user#index")
    end

    it "routes to #new" do
      expect(get: "/lessons_started_by_user/new").to route_to("lessons_started_by_user#new")
    end

    it "routes to #show" do
      expect(get: "/lessons_started_by_user/1").to route_to("lessons_started_by_user#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lessons_started_by_user/1/edit").to route_to("lessons_started_by_user#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lessons_started_by_user").to route_to("lessons_started_by_user#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lessons_started_by_user/1").to route_to("lessons_started_by_user#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lessons_started_by_user/1").to route_to("lessons_started_by_user#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lessons_started_by_user/1").to route_to("lessons_started_by_user#destroy", id: "1")
    end
  end
end
