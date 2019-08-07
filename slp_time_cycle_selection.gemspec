$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "slp_time_cycle_selection/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "slp_time_cycle_selection"
  spec.version     = SlpTimeCycleSelection::VERSION
  spec.authors     = ["bill1997603"]
  spec.email       = ["fan1997603@vip.qq.com"]
  spec.homepage    = "https://github.com/Byzanteam/slp_time_cycle_selection.git"
  spec.summary     = "Skylark Time Cycle Selection App"
  spec.description = "The Time Cycle Selection App of Skylark project"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "> 4.2"
  spec.add_dependency 'jquery-rails'

  spec.add_development_dependency 'pg'
end
