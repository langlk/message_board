class Api::V1::AuthenticationController < Api::V1::BaseController

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
