$:.unshift File.expand_path("../lib", __FILE__)

spec = Gem::Specification.new do |s|
  s.name = "kobra"
  s.version = "0.0.1"
  s.author = "Johan Eckerstroem"
  s.email = "johan@duh.se"
  s.homepage = "http://kobra.ks.liu.se/"
  s.description = s.summary = "Client library for KOBRA."

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.MD"]
  
  # Kobra dependencies
  s.add_dependency "json_pure"
  s.add_dependency "rest-client"

  # Tests
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"

  s.require_path = 'lib'
  s.files = Dir.glob("{lib,spec}/**/*")
end