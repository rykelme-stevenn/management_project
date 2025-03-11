Rails.application.routes.draw do
  # 🔹 Rota de saúde da aplicação
  get "api/up" => "rails/health#show", as: :rails_health_check

  # 🔹 Rotas que exigem o `franchise_slug`
  scope "/api/:franchise_id" do
    resources :users, only: [:index, :show, :create, :update, :destroy] # TODAS as rotas de usuários agora exigem o slug
  end

  # 🔹 Rotas gerais (SEM `franchise_slug`, ex: login)
  scope "/api" do
    post "login", to: "authentication#login"
  end
end
