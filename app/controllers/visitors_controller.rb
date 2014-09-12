class VisitorsController < ApplicationController

  before_filter :find_recent_searches

  def about
  end
  
  def search
    begin
      if search_params
        $neo_server = Neography::Rest.new
        begin 
          @cypher = NGS::Parser.parse("(#{search_params})")

          @cypher[0].gsub!("RETURN committees", "RETURN DISTINCT committees")
          @cypher[0] = @cypher[0] +  " LIMIT 100"

          @results = $neo_server.execute_query(@cypher[0].to_s, @cypher[1])["data"]

          # beautify [TODO]
          @cypher[0].gsub!("MATCH", "<br>MATCH")
          @cypher[0].gsub!("RETURN", "<br>RETURN")
          @cypher[0].gsub!("LIMIT", "<br>LIMIT")
          Search.create(
              :query => search_params,
              :cypher => @cypher[0],
              :results => @results
            )
          
        rescue Excon::Errors::SocketError => e
          flash.now[:error] = "Oops! Neo4j is currently unavailable. Please try your query again later."
        rescue Exception => e
          @cypher = ["Sorry, I didn't understand, please try a different search."]
          @results = []
        ensure
          @results ||= []
        end
      end
    rescue
      @results ||= []
    end
    render :index
  end

  private
  def search_params
    @q = params.require(:q)
  end

  def find_recent_searches
    @recent_searches = Search.select("DISTINCT(searches.query), searches.query, searches.id").order("searches.id DESC").limit(5)
    @people ||= []
  end
end
