# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: action_kit_rest 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "action_kit_rest"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Woodhull"]
  s.date = "2014-08-02"
  s.description = "Gem for interacting with the ActionKit API"
  s.email = "nathan@controlshiftlabs.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".ruby-gemset",
    ".ruby-version",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "action_kit_rest.gemspec",
    "lib/action_kit_rest.rb",
    "lib/action_kit_rest/action.rb",
    "lib/action_kit_rest/api.rb",
    "lib/action_kit_rest/base.rb",
    "lib/action_kit_rest/client.rb",
    "lib/action_kit_rest/list.rb",
    "lib/action_kit_rest/page.rb",
    "lib/action_kit_rest/pages/base.rb",
    "lib/action_kit_rest/pages/import_page.rb",
    "lib/action_kit_rest/pages/signup_page.rb",
    "lib/action_kit_rest/railties.rb",
    "lib/action_kit_rest/response/collection.rb",
    "lib/action_kit_rest/response/raise_error.rb",
    "lib/action_kit_rest/response/validation_error.rb",
    "lib/action_kit_rest/response/wrapper.rb",
    "lib/action_kit_rest/tag.rb",
    "lib/action_kit_rest/user.rb",
    "lib/action_kit_rest/version.rb",
    "spec/action_kit_rest/logger_spec.rb",
    "spec/action_kit_rest/page_spec.rb",
    "spec/action_kit_rest/pages/input_page_spec.rb",
    "spec/action_kit_rest/response/collection_spec.rb",
    "spec/action_kit_rest/response/wrapper_spec.rb",
    "spec/action_kit_rest/user_spec.rb",
    "spec/fixtures/error.json",
    "spec/fixtures/page/collection.json",
    "spec/fixtures/page/object.json",
    "spec/fixtures/user/object.json",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/controlshift/action_kit_rest"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "A wrapper for the ActionKit REST API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vertebrae>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<pry-debugger>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<eventmachine>, [">= 0"])
      s.add_development_dependency(%q<em-synchrony>, [">= 0"])
      s.add_development_dependency(%q<em-http-request>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<vertebrae>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<pry-debugger>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<eventmachine>, [">= 0"])
      s.add_dependency(%q<em-synchrony>, [">= 0"])
      s.add_dependency(%q<em-http-request>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<vertebrae>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<pry-debugger>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<eventmachine>, [">= 0"])
    s.add_dependency(%q<em-synchrony>, [">= 0"])
    s.add_dependency(%q<em-http-request>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
  end
end

