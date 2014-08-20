class GenerateSampleDataWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false  

  def perform
    @neo = Neography::Rest.new

    100.times do
      options = {
        :person => fake_person,
        :principal_committee => fake_company,
        :authorized_committees => [ ]
      }

      range = *(0..5)
      range.sample.times do
        options[:authorized_committees] << fake_company
      end

      ImportCandidateWorker.perform_async(options)
    end

  end

  def fake_company
    {
      :name => Faker::Company.name,
      :address => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :zip => Faker::Address.zip,
      :image => Faker::Company.logo,
      :committee_id => Faker::Lorem.characters(10).upcase
    }
  end

  def fake_person
    { 
      :name => Faker::Name.name,
      :address => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state_abbr,
      :zip => Faker::Address.zip,
      :candidate_id => Faker::Lorem.characters(10).upcase
    }
  end
end