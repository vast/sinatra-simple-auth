# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sinatra-simple-auth"
  s.version     = '0.5.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vasily Polovnyov"]
  s.email       = ["vasily@polovnyov.ru"]
  s.homepage    = "http://github.com/vast/sinatra-simple-auth/"
  s.license     = 'MIT'
  s.summary     = %q{super simple auth extension for Sinatra}
  s.description = %q[super simple auth extension for Sinatra]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('sinatra', '>=1.1.0')
  s.add_development_dependency('rack-test')
  s.add_development_dependency('turn')
end
