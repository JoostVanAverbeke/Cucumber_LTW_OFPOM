require 'silvio_core'
require 'factory_girl'

$application = SilvioCore::ApplicationFactory.new.create

SilvioCore.require_openedge_jar($application.openedge_version.to_s)

require 'silvio_glims'

FactoryGirl.find_definitions
