require "rails_helper"

RSpec.describe "V1::Courts", type: :request do
  describe "GET /v1_courts" do
    it "works! (now write some real specs)" do
      get v1_courts_path
      expect(response).to have_http_status(200)
    end
  end
end
