# these are the default values:
Neography.configure do |config|
  config.protocol       = "http://"
  config.server         = ENV['NEO4J_HOST']
  config.port           = ENV['NEO4J_PORT']
  config.log_file       = "neography.log"
  config.log_enabled    = false
  config.max_threads    = 20
  config.authentication = ENV['NEO4J_AUTH']  # 'basic' or 'digest'
  config.username       = ENV['NEO4J_USERNAME']
  config.password       = ENV['NEO4J_PASSWORD']
end