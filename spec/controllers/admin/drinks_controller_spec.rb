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

  describe "GET #edit" do
    render_views

    let(:drink){ Drink.create(name: "Kenntini", description: "Fairy drink") }

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: drink.id
      expect(response).to be_success # make sure it doesn't blow up
      expect(response).to have_http_status(200) # make sure the http status code that comes back is 200
    end

    it "renders the edit template" do
      get :edit, id: drink.id
      expect(response).to render_template("edit")
    end

    it "shows the drink you are editing" do
      get :edit, id: drink.id
      expect(response.body).to include("Editing: Kenntini")
    end
  end

  describe "PUT #update" do
    render_views

    let(:drink){ Drink.create(name: "Kenntini", description: "Fairy drink") }

    it "responds successfully with a redirect to the show page" do
      put :update, {id: drink.id, drink: {name: "Kenntini-weenie", description: "Small fairy drink"}}
      expect(response).to redirect_to admin_drink_path(drink) # make sure it redirect to the correct path
    end

    it "updates the values of drink to the new params" do
      put :update, {id: drink.id, drink: {name: "Kenntini-weenie", description: "Small fairy drink"}}
      drink.reload
      expect(drink.name).to eq("Kenntini-weenie")
      expect(drink.description).to eq("Small fairy drink")
    end

    it "renders the edit template if the update is unsuccessful" do
      put :update, {id: drink.id, drink: {name: "", description: "Small fairy drink"}}
      expect(response).to render_template(:edit)
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

  describe "DELETE #destroy" do
    render_views

    let(:drink){ Drink.create(name: "Kenntini", description: "Fairy drink") }

    it "responds successfully with a redirect to the index page" do
      delete :destroy, id: drink.id
      expect(response).to redirect_to admin_drinks_path # make sure it redirect to the correct path
    end

    it "deletes the drink" do
      delete :destroy, id: drink.id
      expect(Drink.find_by_id(drink.id)).to be_nil
    end
  end
end
