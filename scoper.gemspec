$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'scoper/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scoper"
  s.version     = Scoper::VERSION
  s.authors     = ["Robert Neumayr"]
  s.email       = ["kontakt@icatcher.at"]
  s.summary     = 'Provides scoping objects for Ruby On Rails models in the YFU ecosystem with the use of pure ruby classes.'
  s.description = 'Object oriented scoping for Rails applications in the YFU ecosystem.'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0"

  # s.add_development_dependency "sqlite3"
end
