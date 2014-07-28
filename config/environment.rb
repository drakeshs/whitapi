# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WhitsonwattApi::Application.initialize!

# DB_SEQUEL = YAML.load_file("#{RAILS_ROOT}/config/initializers/config.yml")[RAILS_ENV]