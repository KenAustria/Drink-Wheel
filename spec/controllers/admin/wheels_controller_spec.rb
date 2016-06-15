require "rails_helper"

RSpec.describe Admin::WheelsController, :type => :controller do
  describe "GET #index" do
  	render_views

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success 
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "shows the List of Wheels heading" do
      get :index
      expect(response.body).to include("List of Wheels")
    end

    it "shows the list of wheels" do
      wheel1 = Wheel.create!(name: "The Unforgettables", description: "Not to be forgotten")
      wheel2 = Wheel.create!(name: "Contemporary Classics", description: "So exceptional")

      get :index
      expect(assigns(:wheels)).to eq([wheel2, wheel1])

      expect(response.body).to include("The Unforgettables")
      expect(response.body).to include("Contemporary Classics")
      expect(response.body).to include("Not to be forgotten")
      expect(response.body).to include("So exceptional")
    end
  end

  describe "GET #new" do
    render_views

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success 
      expect(response).to have_http_status(200) 
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "shows the New Wheel heading" do
      get :new
      expect(response.body).to include("New Wheel")
    end
  end

  describe "POST #create" do
    render_views

    it "redirects back to the admin wheels index page" do
      post :create, wheel: {name: "The Unforgettables", description: "Not to be forgotten"}
      expect(response).to redirect_to(admin_wheels_path)
    end

    it "creates a new wheel" do
      expect do
        post :create, wheel: {name: "The Unforgettables", description: "Not to be forgotten"}
      end.to change(Wheel, :count).by(1)
    end
  end

  describe "GET #edit" do
    render_views

    let(:wheel){ Wheel.create(name: "The Unforgettables", description: "Not to be forgotten") }

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: wheel.id
      expect(response).to be_success 
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      get :edit, id: wheel.id
      expect(response).to render_template("edit")
    end

    it "shows the wheel you are editing" do
      get :edit, id: wheel.id
      expect(response.body).to include("Editing: The Unforgettables")
    end
  end

  describe "PUT #update" do
    render_views

    let(:wheel){ Wheel.create(name: "The Unforgettables", description: "Not to be forgotten") }

    it "responds successfully with a redirect to the show page" do
      put :update, {id: wheel.id, wheel: {name: "The Unforgettables", description: "Not to be forgotten"}}
      expect(response).to redirect_to admin_wheel_path(wheel) 
    end

    it "updates the values of wheel to the new params" do
      put :update, {id: wheel.id, wheel: {name: "The Unforgettables", description: "Not to be forgotten"}}
      wheel.reload
      expect(wheel.name).to eq("The Unforgettables")
      expect(wheel.description).to eq("Not to be forgotten")
    end

    it "renders the edit template if the update is unsuccessful" do
      put :update, {id: wheel.id, wheel: {name: "The Unforgettables", description: "Not to be forgotten"}}
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #show" do
    render_views

    let(:wheel){ Wheel.create(name: "The Unforgettables", description: "Not to be forgotten") }

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: wheel.id
      expect(response).to be_success 
      expect(response).to have_http_status(200) 
    end

    it "renders the show template" do
      get :show, id: wheel.id
      expect(response).to render_template("show")
    end

    it "shows the wheel" do
      get :show, id: wheel.id
      expect(response.body).to include("The Unforgettables")
    end
  end

  describe "DELETE #destroy" do
    render_views

    let(:wheel){ Wheel.create(name: "The Unforgettables", description: "Not to be forgotten") }

    it "responds successfully with a redirect to the index page" do
      delete :destroy, id: wheel.id
      expect(response).to redirect_to admin_wheels_path 
    end

    it "deletes the wheel" do
      delete :destroy, id: wheel.id
      expect(Wheel.find_by_id(wheel.id)).to be_nil
    end
  end
end
