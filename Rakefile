# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc 'Default: run specs.'
task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = './spec/**/*_spec.rb'
  t.rspec_opts = '--color'
end
