# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ContinuumRails::Application.initialize!

# Turn on maximum debug level for now
Rails.logger = Logger.new(STDOUT)
Rails.logger.level = 0
