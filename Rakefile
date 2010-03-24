require 'rubygems'
require 'rake/testtask'
require 'rake/gempackagetask'

task :default => :test

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "sinatra-simple-auth"
    gemspec.version = "0.1.0"
    gemspec.summary = gemspec.description = "super simple auth extension for Sinatra"
    gemspec.email = "vasily@polovnyov.ru"
    gemspec.homepage = "http://github.com/vast/sinatra-simple-auth"
    gemspec.authors = ["Vasily Polovnyov"]

    gemspec.add_dependency 'sinatra', '>=1.0.0'
    gemspec.add_dependency 'rack', '>=0.9.1'

    gemspec.add_development_dependency 'rack-test', '>=0.3.0'

    gemspec.test_files = Dir.glob('test/*')
    gemspec.files = ["LICENSE", "README.md", "Rakefile"] + Dir.glob('lib/**/*') + gemspec.test_files

  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end