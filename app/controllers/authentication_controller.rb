class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def register
    if User.exists?(email: params[:email])
      render json: {"error": "email already exists"}, status: "409"
      return
    end

    @user = User.new(user_params)
    @user.jti = SecureRandom.uuid
    if @user.save
      token =jwt_encode(user_id: @user.id)
      render(json: { message: "User created successfully", user: @user, token: token }, status: :created)
    else
      render(json: @user.errors, status: "422")
    end
  end

  def login
    @user = User.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
        token =jwt_encode(user_id: @user.id)
        render json: { user: @user, token: token}, status: :ok
      else
        render json: {error: "Unauthorized"}, status: :unauthorized
      end
  end

  private

  def user_params
    params.permit(:email, :password, :jti, :age, :username)
  end
end
