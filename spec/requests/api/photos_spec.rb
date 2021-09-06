require 'swagger_helper'

RSpec.describe 'api/photos', type: :request do
  path '/photos' do
    post 'Create a photo' do
      tags 'Photos'
      consumes 'multipart/form-data'
      security [Bearer: {}]
      parameter name: :photo, in: :formData, schema: { '$ref' => '#components/schemas/photo_data' }

      response '201', 'photo created' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    get 'get all photos by report' do
      tags 'Photos'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :report_id, in: :header, type: :string
      response '200', 'get all photos by Reports' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    delete 'delete a photo' do
      tags 'Photos'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :report_id, in: :header, schema: {
        type: :object,
        properties: {
          photo_id: { type: :string }
        }
      }
      response '201', 'photo deleted' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    put 'update a photo' do
      tags 'Photos'
      consumes 'multipart/form-data'
      security [Bearer: {}]
      parameter name: :photo, in: :formData, schema: { '$ref' => '#components/schemas/photo_data' }

      response '201', 'photo updated' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end
end
