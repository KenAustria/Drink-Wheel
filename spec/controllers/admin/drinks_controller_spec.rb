require "rails_helper"

RSpec.describe Admin::DrinksController, :type => :controller do
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

    it "shows the List of Drinks heading" do
      get :index
      expect(response.body).to include("List of Drinks")
    end

    it "shows the list of drinks" do
      drink1 = Drink.create!(name: "Kenntini", description: "Tiny drink")
      drink2 = Drink.create!(name: "Benny Lava", description: "Curry liquid")

      get :index
      expect(assigns(:drinks)).to eq([drink2, drink1])

      expect(response.body).to include("Kenntini")
      expect(response.body).to include("Benny Lava")
      expect(response.body).to include("Tiny drink")
      expect(response.body).to include("Curry liquid")
    end
  end

  describe "GET #new" do
    render_views

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success # make sure it doesn't blow up
      expect(response).to have_http_status(200) # make sure the http status code that comes back is 200
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "shows the New Drink heading" do
      get :new
      expect(response.body).to include("New Drink")
    end
  end

  describe "POST #create" do
    render_views

    it "redirects back to the admin drinks index page" do
      post :create, drink: {name: "Kenntini", description: "Fairy drink"}
      expect(response).to redirect_to(admin_drinks_path)
    end

    it "creates a new drink" do
      expect do
        post :create, drink: {name: "Kenntini", description: "Fairy drink"}
      end.to change(Drink, :count).by(1)
    end
  end
end
