

class ImportCandidateWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(options)
    options.symbolize_keys!
    @neo = Neography::Rest.new

    candidate = Neography::Node.create(options[:person])
    @neo.add_label(candidate, ["Person", "Candidate"])

    # principal committee
    if options[:principal_committee]
      principal_committee = Neography::Node.create(options[:principal_committee])
      @neo.add_label(principal_committee, "Committee")
      principal_committee.outgoing(:supports) << candidate
    end

    # authorized committees
    options[:authorized_committees].each do |committee_options|
      committee = Neography::Node.create(committee_options)
      @neo.add_label(committee, "Committee")
      committee.outgoing(:supports) << candidate
    end
  end
end