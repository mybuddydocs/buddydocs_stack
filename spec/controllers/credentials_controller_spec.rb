
require 'rails_helper'
require 'pry-byebug'

RSpec.describe CredentialsController, type: :controller do

  describe "GET #index" do
    let(:laetitia) {create(:user)}
    let(:cdiscount) {create(:connector)}
    let(:credentials) {create_list(:credential, 5, user: laetitia, connector: cdiscount)}
    it 'should get index' do
      sign_in laetitia
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
    it 'should list all credentials' do
      sign_in laetitia
      redirect_to credentials_path

      credentials.each do |credential|
        expect(credential.login).to be_truthy
        expect(credential.password).to be_truthy
      end
    end
  end
end
