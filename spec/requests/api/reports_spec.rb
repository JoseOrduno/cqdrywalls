require 'swagger_helper'

RSpec.describe 'api/reports', type: :request do
  path '/reports' do
    post 'Creates a report' do
      tags 'Reports'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :report, in: :body, schema: { '$ref' => '#components/schemas/report_data' }

      response '201', 'report created' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    get 'get all reports' do
      tags 'Reports'
      consumes 'application/json'
      security [Bearer: {}]

      response '200', 'get reports' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end

  path '/reports/{id}' do
    get 'get report' do
      tags 'Reports'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response '200', 'get reports' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    delete 'delete report' do
      tags 'Reports'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response '201', 'delete report' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end

    put 'update report' do
      tags 'Reports'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :report, in: :body, schema: { '$ref' => '#components/schemas/report_data' }
      response '201', 'report update' do
        run_test!
      end

      response '422', 'invalid request' do
        run_test!
      end
    end
  end
end
