RSpec.describe CurrenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/currencies").to route_to("currencies#index")
    end

    it "routes to #show" do
      expect(get: "/currencies/1").to route_to("currencies#show", id: "1")
    end
  end
end
