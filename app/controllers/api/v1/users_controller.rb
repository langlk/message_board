class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :restrict_access, only: [:create]

  def create
    @user = User.new(user_params)
    @user.save!
    json_response({message: "User #{@user.name} created with email #{@user.email}."}, :created)
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
