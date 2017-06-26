require "rails_helper"

RSpec.describe V1::CourtsController, type: :routing do
  it "routes to #index" do
    expect(get: "/v1/courts").to route_to("v1/courts#index")
  end

  xit "routes to #new" do
    expect(get: "/v1/courts/new").to route_to("v1/courts#new")
  end

  it "routes to #show" do
    expect(get: "/v1/courts/1").to route_to("v1/courts#show", id: "1")
  end

  xit "routes to #create" do
    expect(post: "/v1/courts").to route_to("v1/courts#create")
  end

  xit "routes to #update via PUT" do
    expect(put: "/v1/courts/1").to route_to("v1/courts#update", id: "1")
  end

  xit "routes to #update via PATCH" do
    expect(patch: "/v1/courts/1").to route_to("v1/courts#update", id: "1")
  end

  xit "routes to #destroy" do
    expect(delete: "/v1/courts/1").to route_to("v1/courts#destroy", id: "1")
  end
end
