class Api::V1::RolesController < ApplicationController
  def create
    if Role.find_by(name: params[:data][:attributes][:name])
      render json: {"error": "role #{params[:data][:attributes][:name]} already exists"}, status: "409"
      return
    end

    @role = Role.create(role_params)

    if @role.save
      render json: { message: "Role #{params[:data][:attributes][:name]} created successfully"}, status: "201"
    else
      render json: {message: @role.errors}, status: "422"
    end
  end

  private

  def role_params
    params.require(:data).require(:attributes).permit(:name)
  end
end
