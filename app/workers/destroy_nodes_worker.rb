class DestroyNodesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform
    @neo = Neography::Rest.new    
    results = @neo.execute_query "MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n,r"
    puts results
  end
end