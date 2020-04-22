RSpec.describe "/currencies", type: :request do

  let(:token) { JsonWebToken.encode(user_id: User.last.id) }

  let(:valid_headers) { { 'Accept':  'Application/Json',
                          'Authorization': "Bearer #{token}"
  } }
  let(:invalid_headers) { { 'Accept': 'Application/Json' } }

  let(:valid_attributes) {
    {
        # 'username' => 'Vasya',
        'name'                  => 'Vasya',
        'email'                 => 'vasya@example.com',
        'password'              => 'vasya_pupkin',
        'password_confirmation' => 'vasya_pupkin'
    }
  }
  let(:invalid_attributes) {
    {
        username:              nil,
        name:                  nil,
        email:                 'aeq24c2q43rc',
        password:              '',
        password_confirmation: ''
    }
  }

  before :all do
    Rails.application.load_tasks
    Rake::Task['currencies:refresh'].invoke
  end

  before do
    create_user
  end

  after do
    Currency.destroy_all
  end

  context 'with valid attributes' do
    describe "GET /currencies" do
      it "renders a successful response" do

        get "/currencies", :params => { :page => 1 }, :headers => valid_headers

        expect(response.content_type).to eq("application/json")
        expect(eval(response.body).count).to eq(Currency.per_page)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /currencies/:id" do
      it "renders a successful response" do
        get "/currencies/#{Currency.first.id}", :headers => valid_headers

        expect(response.content_type).to eq("application/json")
        expect(eval(response.body).count).to eq(7)
        expect(response).to have_http_status(:success)
      end
    end

  end

  context 'with invalid attributes' do

    describe "GET /currencies" do
      it "renders response with error" do
        get "/currencies", :params => { :page => 1 }, :headers => invalid_headers

        expect(response.content_type).to eq("application/json")
        expect(eval(response.body).count).to eq(1)
        expect(eval(response.body)).to have_key(:errors)
        expect(response).to have_http_status(401)
      end
    end

    describe "GET /currencies/:id" do
      it "renders response with error" do
        get "/currencies/1", :headers => invalid_headers

        expect(response.content_type).to eq("application/json")
        expect(eval(response.body).count).to eq(1)
        expect(eval(response.body)).to have_key(:errors)
        expect(response).to have_http_status(401)
      end
    end

  end

  def create_user
    post "/users", params: { email: 'test@test.ru', name: 'User', username: 'username', password: 'password', password_confirmation: 'password' }
  end
end
