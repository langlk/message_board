class Api::V1::GroupsController < Api::V1::BaseController
  def index
    @groups = Group.all
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end
end
