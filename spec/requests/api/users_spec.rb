require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'users'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          lastname: { type: :string },
          email: { type: :string },
          password: { type: :string },
          role: {
            type: :string,
            enum: %i[admin employee]
          }
        },
        required: %w[title content]
      }

      response '201', 'blog created' do
        let(:blog) { { title: 'foo', content: 'bar' } }
        let(:Authorization) { "Bearer #{token_for(user)}" }

        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
