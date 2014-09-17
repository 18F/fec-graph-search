class GenerateLeslieWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false  

  def perform
    options = generate_fake_options

    ImportCandidateWorker.perform_async(options)

  end

  def fake_company_options
    {
      :name => Faker::Company.name,
      :address => Faker::Address.street_address,
      :city => 'Pawnee',
      :state => 'IN',
      :zip => '62558',
      :image => Faker::Company.logo,
      :committee_id => Faker::Lorem.characters(10).upcase
    }
  end

  def leslie_person_options
    { 
      :name => 'Leslie Knope',
      :address => Faker::Address.street_address,
      :city => 'Pawnee',
      :state => 'IN',
      :zip => '62558',
      :candidate_id => Faker::Lorem.characters(10).upcase,
      :is_candidate => true,
      :image => 'http://3.bp.blogspot.com/-9vUMSuz1zek/UF4NkAkOZxI/AAAAAAAAAeo/rER804X_f3Q/s1600/featured-match-leslie-knope.jpg'
    }
  end

  def generate_fake_options
    options = {
      :person => leslie_person_options,
      :principal_committee => fake_company_options,
      :authorized_committees => []
    }
    range = *(3..5)
    range.sample.times do
      options[:authorized_committees] << fake_company_options
    end
    options
  end
end