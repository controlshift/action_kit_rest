# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require './lib/action_kit_rest/version.rb'


require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "action_kit_rest"
  gem.version = ActionKitRest::VERSION::STRING
  gem.homepage = "http://github.com/controlshift/action_kit_rest"
  gem.license = "MIT"
  gem.summary = %Q{A wrapper for the ActionKit REST API}
  gem.description = %Q{Gem for interacting with the ActionKit API}
  gem.email = "systems@controlshiftlabs.com"
  gem.authors = ["Nathan Woodhull", 'Diego Marcet', 'Jacinda Moore']
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new


require 'rspec/core/rake_task'
desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  t.rspec_opts = '--color'
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "action_kit_rest #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
