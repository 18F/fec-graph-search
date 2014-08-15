class ImportCandidateWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  @@NEO = Neography::Rest.new

  def perform(options)
    options.symbolize_keys!

    candidate = Neography::Node.create(options[:person])
    node = @@NEO.get_node(candidate)

    @@NEO.add_label(candidate, ["Person", "Candidate", "Entity"])
    node_id = node["self"].split('/').last.to_i
    # binding.pry
    @@NEO.add_node_to_index("people", "name", options[:person]['name'], node_id)
    @@NEO.add_node_to_index("candidates", "name", options[:person]['name'], node_id)
    @@NEO.add_node_to_index("entities", "name", options[:person]['name'], node_id)

    # principal committee
    if options[:principal_committee]
      principal_committee = Neography::Node.create(options[:principal_committee])
      @@NEO.add_label(principal_committee, "Committee")
      principal_committee.outgoing(:supports) << candidate
    end

    # authorized committees
    options[:authorized_committees].each do |committee_options|
      committee = Neography::Node.create(committee_options)
      @@NEO.add_label(committee, "Committee")
      committee.outgoing(:supports) << candidate
    end
  end
end
