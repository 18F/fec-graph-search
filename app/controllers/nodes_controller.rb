class NodesController < ApplicationController

  def show
    $neo_server = Neography::Rest.new

    if node_params[:id]
      @node = $neo_server.get_node(node_params[:id].split("/").last)
      if @node['data']['is_candidate']
        render :person
      else
        render :committee
      end
    end
  end

  def node_params
    params.permit(:id)
  end
end
