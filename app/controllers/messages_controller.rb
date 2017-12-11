class MessagesController < ApplicationController
  include Response
  
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    json_response(@messages)
  end
end
