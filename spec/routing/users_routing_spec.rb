RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users").to route_to("users#index")
    end

    it "routes to #show" do
      expect(get: "/users/Vasya").to route_to("users#show", _username: "Vasya")
    end

    it "routes to #create" do
      expect(post: "/users").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/Vasya").to route_to("users#update", _username: "Vasya")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/Vasya").to route_to("users#update", _username: "Vasya")
    end

    it "routes to #destroy" do
      expect(delete: "/users/Vasya").to route_to("users#destroy", _username: "Vasya")
    end
  end
end
