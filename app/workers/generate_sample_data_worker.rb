class GenerateSampleDataWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false  

  def perform
    500.times do
      options = generate_fake_options

      ImportCandidateWorker.perform_async(options)
    end

  end

  def fake_company_options
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

  def fake_person_options
    { 
      :name => Faker::Name.name,
      :address => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state_abbr,
      :zip => Faker::Address.zip,
      :candidate_id => Faker::Lorem.characters(10).upcase,
      :is_candidate => true
    }
  end

  def generate_fake_options
    options = {
      :person => fake_person_options,
      :principal_committee => fake_company_options,
      :authorized_committees => []
    }
    range = *(0..5)
    range.sample.times do
      options[:authorized_committees] << fake_company_options
    end
    options
  end
end