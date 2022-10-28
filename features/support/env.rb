require 'silvio_core'
require 'factory_girl'

$application = SilvioCore::ApplicationFactory.new.create

SilvioCore.require_openedge_jar($application.openedge_version.to_s)

require 'silvio_glims'
require 'silvio_hl7_factory'

FactoryGirl.find_definitions

appserver = SilvioCore::Appserver.new
appserver.authenticateWith('sysman', 'mansys', true)

result=appserver.clearInstanceData

if result.nil?
  puts 'Clear the instance data on the appserver'
else
  puts "Clear the instance data on the appserver (Glims version: #{result['GlimsVersion']})"
end

