class MessagesController < ApplicationController
  include Response
  include ResponseErrors

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    json_response(@messages)
  end

  def create
    @group = Group.find(params[:group_id])
    @user = current_user
    @message = @group.messages.new(message_params)
    @message.user = @user
    @message.save!
    json_response(@message, :created)
  end

private
  def message_params
    params.permit(:content)
  end

  def current_user
    AuthorizeApiRequest.call(request.headers).result
  end
end
