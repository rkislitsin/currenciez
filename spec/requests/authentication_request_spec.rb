require 'rails_helper'

RSpec.describe "Authentications", type: :request do

  describe 'POST /login' do

    before do
      create_user
    end

    context 'with valid attributes' do

      it "returns auth information" do
        post "/login", params: { email: 'test@test.ru', password: 'password' }
        expect(response.body).to_not be_empty
        expect(eval(response.body)).to have_key(:token)
      end

      it 'successfull response' do
        expect(response.successful?).to be_truthy
      end
    end

    context 'with invalid attributes' do

      it "returns error" do
        post "/login", params: { email: 'test@test.ru', password: 'wrong_password' }
        expect(response.body).to_not be_empty
        expect(eval(response.body)).to have_key(:error)
      end

      it 'successfull response' do
        expect(response.successful?).to be_truthy
      end
    end


  end

  def create_user
    post "/users", params: { email: 'test@test.ru', name: 'User', username: 'username', password: 'password', password_confirmation: 'password' }
  end

end
