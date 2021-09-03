require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/login' do
    post 'user-login with simple credentials' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        }
      }

      response '201', 'user created' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end

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

      response '201', 'user created' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
    get 'get all users' do
      tags 'users'
      consumes 'application/json'
      security [Bearer: {}]

      response '201', 'get users' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end
end
