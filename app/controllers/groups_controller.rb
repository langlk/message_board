class GroupsController < ApplicationController
  include Response
  include ResponseErrors

  def index
    @groups = Group.all
    json_response(@groups)
  end

  def show
    binding.pry
    @group = Group.find(params[:id])
    json_response(@group)
  end
end
