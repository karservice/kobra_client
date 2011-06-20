$:.unshift File.expand_path("../lib", __FILE__)

spec = Gem::Specification.new do |s|
  s.name = "kobra_client"
  s.version = "0.0.2"
  s.author = "Johan Eckerstroem"
  s.email = "johan@duh.se"
  s.homepage = "http://kobra.ks.liu.se/"
  s.summary = "Client library for KOBRA."
  s.description = "Used for access to KOBRA, API-account needed"

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.MD"]

  # Kobra dependencies
  s.add_dependency("json_pure", "~> 1.5.2")
  s.add_dependency("rest-client", "~> 1.6.3")

  # Tests
  s.add_development_dependency("rspec", "~> 2.6.0")
  s.add_development_dependency("webmock", "~> 1.6.4")

  s.require_path = 'lib'
  s.files = Dir.glob("{lib,spec}/**/*")
end
