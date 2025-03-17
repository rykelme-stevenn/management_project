Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001' # frontend port
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head]
    end
    allow do
      origins 'https://manegement-project.vercel.app'
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
end
  