require 'rails_helper'

RSpec.describe 'Withdrawals API', type: :request do
  describe 'get /withdrawal' do
    let(:valid_attribut) { { amount: 250 } }

    before { get '/withdrawal', params: valid_attribut }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns data' do
      expect(JSON.parse(response.body)).not_to be_empty
    end
  end
end