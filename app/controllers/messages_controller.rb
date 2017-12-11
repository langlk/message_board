class MessagesController < ApplicationController
  include Response
  include ResponseErrors

  def index
    @group = Group.find(params[:group_id])
    if params[:start_time] && params[:end_time]
      start_time = Time.parse(params[:start_time]).utc
      end_time = Time.parse(params[:end_time]).utc
      @messages = @group.messages.timeframe(start_time, end_time)
    else
      @messages = @group.messages
    end
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

  def update
    @group = Group.find(params[:group_id])
    @user = current_user
    @message = @group.messages.find(params[:id])
    if @user == @message.user
      @message.update(message_params)
      render status: 200, json: {
        message: "Your message has been updated successfully."
      }
    else
      render status: 401, json: {
        message: "Not authorized to edit this message."
      }
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @user = current_user
    @message = @group.messages.find(params[:id])
    if @user == @message.user
      @message.destroy
      render status: 200, json: {
        message: "Your message has been deleted successfully."
      }
    else
      render status: 401, json: {
        message: "Not authorized to delete this message."
      }
    end
  end

private
  def message_params
    params.permit(:content)
  end

  def current_user
    AuthorizeApiRequest.call(request.headers).result
  end
end
