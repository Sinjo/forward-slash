lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "restful_operator/version"

Gem::Specification.new do |s|
  s.name        = "restful_operator"
  s.version     = RestfulOperator::VERSION
  s.date        = "2015-03-23"
  s.summary     = "Restful Operator"
  s.description = "Built-in syntax for the web"
  s.authors     = ["Chris Sinjakli"]
  s.email       = "chris@sinjakli.co.uk"
  s.files       = ["lib/restful_operator.rb"]
  s.homepage    = "https://github.com/sinjo/restful_operator"
  s.license     = "MIT"

  s.add_dependency "binding_of_caller", "~> 0.7.2"

  s.add_development_dependency "pry", "~> 0.10.1"
  s.add_development_dependency "rspec", "~> 3.4.0"
  s.add_development_dependency "webmock", "~> 1.22.6"
end
