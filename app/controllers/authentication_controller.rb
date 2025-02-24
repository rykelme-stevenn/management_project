class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { token: token }, status: :ok
        else
        render json: { error: "Password or email invalids" }, status: :unauthorized
        end
    end

    private

    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
    end
end
