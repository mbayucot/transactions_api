require 'rails_helper'

RSpec.describe 'Transactions API', type: :request do
  let(:valid_single_attributes) {
    {
      transaction: {
        transaction_id: Faker::Number.unique.number(digits: 10).to_s,
        points: Faker::Number.number(digits: 3),
        user_id: Faker::Alphanumeric.alpha(number: 10)
      }
    }
  }

  let(:valid_bulk_attributes) {
    {
      transactions:
        [
          {
            transaction_id: Faker::Number.unique.number(digits: 10).to_s,
            points: Faker::Number.number(digits: 3),
            user_id: Faker::Alphanumeric.alpha(number: 10) },
          {
            transaction_id: Faker::Number.unique.number(digits: 10).to_s,
            points: Faker::Number.number(digits: 3),
            user_id: Faker::Alphanumeric.alpha(number: 10)
          }
      ]
    }
  }

  describe 'POST /api/v1/transactions/single' do
    context 'with valid parameters' do
      it 'creates a new Transaction' do
        expect {
          post '/api/v1/transactions/single', params: valid_single_attributes
        }.to change(Transaction, :count).by(1)
      end

      it 'returns status code 201' do
        post '/api/v1/transactions/single', params: valid_single_attributes
        expect(response).to have_http_status(201)
        expect(json).to include_json('transaction_id': valid_single_attributes[:transaction][:transaction_id])
      end
    end

    context 'with invalid parameters' do
      it 'returns status code 422' do
        post '/api/v1/transactions/single', params: { transaction: { points: 100, user_id: 'user_1' } }
        expect(response).to have_http_status(422)
        expect(json).to include_json('transaction_id': ["can't be blank"])
      end
    end
  end

  describe 'POST /api/v1/transactions/bulk' do
    context 'with valid parameters' do
      it 'creates new Transactions' do
        expect {
          post '/api/v1/transactions/bulk', params: valid_bulk_attributes
        }.to change(Transaction, :count).by(2)
      end

      it 'returns status code 201' do
        post '/api/v1/transactions/bulk', params: valid_bulk_attributes
        expect(response).to have_http_status(201)
        expect(json).to include_json('processed_count': 2)
      end
    end

    context 'with invalid parameters' do
      it 'returns status code 422' do
        post '/api/v1/transactions/bulk', params: { transactions: [{ points: 100, user_id: 'user_1' }] }
        expect(response).to have_http_status(422)
        expect(json).to include_json('transaction_id': ["can't be blank"])
      end
    end
  end
end
