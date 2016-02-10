require "rails_helper"

RSpec.describe DrinksController, :type => :controller do
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

  describe "GET #show" do
    render_views

    let(:drink){ Drink.create(name: "Kenntini", description: "Fairy drink") }

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: drink.id
      expect(response).to be_success # make sure it doesn't blow up
      expect(response).to have_http_status(200) # make sure the http status code that comes back is 200
    end

    it "renders the show template" do
      get :show, id: drink.id
      expect(response).to render_template("show")
    end

    it "shows the drink" do
      get :show, id: drink.id
      expect(response.body).to include("Kenntini")
    end
  end
end 