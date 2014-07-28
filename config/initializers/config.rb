DB_SEQUEL = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

# require 'ostruct'
# require 'yaml'

# all_config = YAML.load_file("#{Rails.root}/config/constants_file/config.yml") || {}
# env_config = all_config[Rails.env] || {}
# AppConfig = OpenStruct.new(env_config)
# p"******************"

# CONFIG = YAML.load_file("#{Rails.root.to_s}/config/config.yml")[Rails.env]