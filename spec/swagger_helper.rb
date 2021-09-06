# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Cqdrywalls-api',
        description: 'api for cqdrywalls apps',
        contact: 'jose.m.orduno@gmail.com',
        license: 'MIT',
        version: 'v1'
      },
      paths: {},
      components: {
        securitySchemes: {
          Bearer: {
            description: 'JWT key necessary to use API calls',
            type: :apiKey,
            name: 'authorization',
            in: :header
          }
        },
        schemas: {
          report_data: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              employee_id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              address: { type: :string },
              start_date: { type: :string, format: :date },
              finish_date: { type: :string, format: :date },
              cost: { type: :number },
              latitude: { type: :number, format: :Float },
              longitude: { type: :number, format: :Float }
            }
          },
          user_data: {
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
            }
          },
          login_data: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          },
          photo_data: {
            type: :object,
            properties: {
              image_file: { type: :file },
              name: { type: :string },
              report_id: { type: :integer }
            }
          },
          comment_data: {
            type: :object,
            properties: {
              title: { type: :string },
              body: { type: :string },
              user_id: { type: :integer },
              report_id: { type: :integer }
            }
          }
        }
      },
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'https://rocky-journey-06295.herokuapp.com/'
            }, 
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
