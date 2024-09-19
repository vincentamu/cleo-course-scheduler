require 'rails_helper'

RSpec.describe "StudentDashboards", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/student_dashboards/show"
      expect(response).to have_http_status(:success)
    end
  end

end
