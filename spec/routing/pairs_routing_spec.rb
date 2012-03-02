require "spec_helper"

describe PairsController do
  describe "routing" do

    it "routes to #index" do
      get("/pairs").should route_to("pairs#index")
    end

    it "routes to #new" do
      get("/pairs/new").should route_to("pairs#new")
    end

    it "routes to #show" do
      get("/pairs/1").should route_to("pairs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pairs/1/edit").should route_to("pairs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pairs").should route_to("pairs#create")
    end

    it "routes to #update" do
      put("/pairs/1").should route_to("pairs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pairs/1").should route_to("pairs#destroy", :id => "1")
    end

  end
end
