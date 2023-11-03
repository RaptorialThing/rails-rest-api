class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action ->{ authorize_roles!(["admin","author"])}, only: [:index]

  def create_relationship
    if UserRole.exists?(user_id: params[:user_id], role_id: params[:role_id])
      render json: {"error": "user_role already created"}, status: "409"
      return
    end

    return render json: {"error": "Role #{params[:role_id]} does not exists"}, status: "422" unless Role.exists?(id: params[:role_id])

    @user_role = UserRole.create(relationships_params)
    if @user_role.save
      render json: {message: "UserRole created successfully"}, status: "201"
    else
      render json: {message: @user_role.errors}, status: "422"
    end
  end

  private

  def relationships_params
    params.permit(:user_id, :role_id)
  end
end

