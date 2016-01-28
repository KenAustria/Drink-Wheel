require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET #index" do
  	render_views

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success # make sure it doesn't blow up
      expect(response).to have_http_status(200) # make sure the http status code that comes back is 200
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "shows the time prompt" do
      get :index
      expect(response.body).to include("The time is now")
    end
  end
end
