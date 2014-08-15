class VisitorsController < ApplicationController

  def about
  end
  
  def search
    if search_params
      $neo_server = Neography::Rest.new
      begin 
        @cypher = NGS::Parser.parse("(#{search_params.downcase})")
        # @cypher[0] = @cypher[0] +  " , people.name LIMIT 100"
        @cypher[0] = @cypher[0] +  " LIMIT 100"
        # @cypher[1].merge!({"me" => 2}) if @cypher[1].has_key?("me")
        @people = $neo_server.execute_query(@cypher[0].to_s, @cypher[1])["data"]

        @cypher[0].gsub!("MATCH", "<br>MATCH")
        @cypher[0].gsub!("RETURN", "<br>RETURN")
        @cypher[0].gsub!("LIMIT", "<br>LIMIT")
      rescue Exception => e
        # @cypher = ["Sorry, I didn't understand, please try a different search."]
        @results = e
      end
    end
    render :index
  end

  private
  def search_params
    @q = params.require(:q)
  end
end
