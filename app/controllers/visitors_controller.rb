class VisitorsController < ApplicationController

  before_filter :search_params

  private
  def search_params
    @q = params[:q] || ""
    begin 
      @cypher = NGS::Parser.parse("(#{@q})")
      # @cypher[0] = @cypher[0] +  " , people.uid, people.name, people.image_url LIMIT 100"
      @cypher[0] = @cypher[0] +  " , LIMIT 100"
      # @cypher[1].merge!({"me" => @user.neo_id}) if @cypher[1].has_key?("me")
      # @people = $neo_server.execute_query(@cypher[0].to_s, @cypher[1])["data"]
      @cypher[0].gsub!("MATCH", "<br>MATCH")
      @cypher[0].gsub!("RETURN", "<br>RETURN")
      @cypher[0].gsub!("LIMIT", "<br>LIMIT")
    rescue Exception => e
      @cypher = ["Sorry, I didn't understand, please try a different search."]
      @people = []
    end
  end
end
