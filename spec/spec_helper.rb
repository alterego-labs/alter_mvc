$TESTING = true
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

$CODECLIMATE_REPO_TOKEN = '1d6997f6b4d85edac170765d42aa41f0378c9722d87665960b35dcbbd10bd2de'

require 'rspec/its'
require 'alter_mvc'
require 'rspec/given'
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = 'random'
end
