class Api::V1::BaseController < ApplicationController
  attr_reader :current_user
  before_action :authenticate_request

  private
  
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end
end
