require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  path '/comments' do
    post 'Create a comment' do
      tags 'Comments'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :comment, in: :formData, schema: { '$ref' => '#components/schemas/comment_data' }

      response '201', 'comment created' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    get 'get all comments by report' do
      tags 'Comments'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :report_id, in: :header, type: :string
      response '200', 'get all comments by report' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    delete 'delete a comment' do
      tags 'Comments'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :report_id, in: :header, schema: {
        type: :object,
        properties: {
          comment_id: { type: :string }
        }
      }
      response '201', 'comment deleted' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    put 'update a comment' do
      tags 'Comments'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :comment, in: :formData, schema: { '$ref' => '#components/schemas/comment_data' }

      response '201', 'comment updated' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end
end
