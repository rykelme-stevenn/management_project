require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManagementProject
  class Application < Rails::Application
        config.action_dispatch.allow_browser = false
        # 🔹 Configuração de CORS para permitir requisições do frontend (Next.js)
        config.middleware.insert_before 0, Rack::Cors do
          allow do
            origins "http://localhost:3001" # 🔹 Permite requisições do frontend
    
            resource "*",
              headers: :any,
              expose: ["Authorization"], # 🔹 Expõe o header Authorization para o frontend
              methods: [:get, :post, :put, :patch, :delete, :options, :head],
              credentials: true # 🔹 Permite cookies e autenticação segura
          end
        end
      end
  
end
