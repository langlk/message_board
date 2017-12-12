class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :restrict_access, only: [:create]

  def create
    @user = User.new(user_params)
    @user.save!
    json_response(
      {
        message: "User created successfully.",
        name: @user.name,
        email: @user.email,
        key: @user.api_key.access_token
      },
      :created
    )
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
