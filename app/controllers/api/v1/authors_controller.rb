class Api::V1::AuthorsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_user, only: [:show, :destroy]

  # def index
  #   #authorize_roles!(["admin","author"])
  #   # @authors = User.includes(:roles).where('roles.name = ?','author').references(:roles)
  #   # render(json: @admins)
  #   @users = User.all
  # end

  def show
    #authorize_roles!(["admin","author"])
    @author = User.where('users.id =? ',params[:id]).includes(:roles).where('roles.name = ?','author').references(:roles)
    render(json: @author)
  end

  def create
    author_params
    #authorize_roles!(["admin"])
    role_id = Role.where(name: "author").first.id
    @user_author = UserRole.where("user_id = ? and role_id =?", params[:author_id],
      role_id
      ).first_or_initialize(user_id: params[:author_id], role_id: role_id)
    @user_author.save

    render json: @user_author.user
  end

  def update
    #authorize!(:update)

    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    #authorize_roles!(["admin"])

    role_id = Role.where(name: "author").first.id
    @author = UserRole.where("user_id =? and role_id =?", params[:id],role_id).each{
      |user_role| user_role.destroy }
    render json: {message: "author destroyed; user #{params[:id]} not author now" }
  end

  private

  def author_params
    params.permit(:author_id).require(:author_id)
  end
end
