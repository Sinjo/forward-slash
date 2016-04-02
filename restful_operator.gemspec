lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "forward_slash/version"

Gem::Specification.new do |s|
  s.name          = "forward-slash"
  s.version       = ForwardSlash::VERSION
  s.date          = "2015-03-23"
  s.summary       = "An HTTP client with REST literals"
  s.description   = ""
  s.authors       = ["Chris Sinjakli"]
  s.email         = "chris@sinjakli.co.uk"
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.homepage      = "https://github.com/sinjo/forward-slash"
  s.license       = "MIT"

  s.add_dependency "binding_of_caller", "~> 0.7.2"

  s.add_development_dependency "pry", "~> 0.10.1"
  s.add_development_dependency "rspec", "~> 3.4.0"
  s.add_development_dependency "webmock", "~> 1.22.6"
end
