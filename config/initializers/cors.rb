# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

if Rails.env.production?
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # TODO: アクセスを全て許可してしまっているため修正が必要。
      origins "*"

      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
        # credentials: true
    end
  end
else
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # origins 'http://localhost:19000', 'http://localhost:19001', 'http://localhost:19002', 'localhost:19000', 'localhost:19001', 'localhost:19002'
      # TODO: アクセスを全て許可してしまっているため修正が必要。 実機からのアクセスにはIPを直接入れなければならないため、その対応として一時的に全許可にしている。
      origins "*"

      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
        # credentials: true
    end
  end
end
