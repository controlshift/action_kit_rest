# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: action_kit_rest 0.3.5 ruby lib

Gem::Specification.new do |s|
  s.name = "action_kit_rest".freeze
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Woodhull".freeze, "Diego Marcet".freeze, "Jacinda Moore".freeze]
  s.date = "2018-05-21"
  s.description = "Gem for interacting with the ActionKit API".freeze
  s.email = "systems@controlshiftlabs.com".freeze
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
    "action_kit_rest.gemspec",
    "lib/action_kit_rest.rb",
    "lib/action_kit_rest/action.rb",
    "lib/action_kit_rest/actions/event_create_action.rb",
    "lib/action_kit_rest/actions/event_signup_action.rb",
    "lib/action_kit_rest/actions/unsubscribe_action.rb",
    "lib/action_kit_rest/api.rb",
    "lib/action_kit_rest/base.rb",
    "lib/action_kit_rest/client.rb",
    "lib/action_kit_rest/event.rb",
    "lib/action_kit_rest/event_signup.rb",
    "lib/action_kit_rest/language.rb",
    "lib/action_kit_rest/list.rb",
    "lib/action_kit_rest/page.rb",
    "lib/action_kit_rest/pages/base.rb",
    "lib/action_kit_rest/pages/donation_page.rb",
    "lib/action_kit_rest/pages/event_campaign_page.rb",
    "lib/action_kit_rest/pages/import_page.rb",
    "lib/action_kit_rest/pages/signup_page.rb",
    "lib/action_kit_rest/pages/unsubscribe_page.rb",
    "lib/action_kit_rest/phone.rb",
    "lib/action_kit_rest/railties.rb",
    "lib/action_kit_rest/response/collection.rb",
    "lib/action_kit_rest/response/raise_error.rb",
    "lib/action_kit_rest/response/validation_error.rb",
    "lib/action_kit_rest/response/wrapper.rb",
    "lib/action_kit_rest/tag.rb",
    "lib/action_kit_rest/user.rb",
    "lib/action_kit_rest/version.rb",
    "spec/fixtures/action/event_create_action.json",
    "spec/fixtures/action/event_signup_action.json",
    "spec/fixtures/error.json",
    "spec/fixtures/page/campaign.json",
    "spec/fixtures/page/collection.json",
    "spec/fixtures/page/find_campaign.json",
    "spec/fixtures/page/find_event_create.json",
    "spec/fixtures/page/find_event_signup.json",
    "spec/fixtures/page/object.json",
    "spec/fixtures/phone/object.json",
    "spec/fixtures/user/object_with_phones.json",
    "spec/fixtures/user/object_without_phones.json",
    "spec/lib/action_kit_rest/actions/event_create_action_spec.rb",
    "spec/lib/action_kit_rest/actions/event_signup_action_spec.rb",
    "spec/lib/action_kit_rest/logger_spec.rb",
    "spec/lib/action_kit_rest/page_spec.rb",
    "spec/lib/action_kit_rest/pages/event_campaign_page_spec.rb",
    "spec/lib/action_kit_rest/pages/import_page_spec.rb",
    "spec/lib/action_kit_rest/response/collection_spec.rb",
    "spec/lib/action_kit_rest/response/wrapper_spec.rb",
    "spec/lib/action_kit_rest/user_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/shared_contexts/stub_logger.rb"
  ]
  s.homepage = "http://github.com/controlshift/action_kit_rest".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A wrapper for the ActionKit REST API".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vertebrae>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<eventmachine>.freeze, [">= 0"])
      s.add_development_dependency(%q<em-synchrony>.freeze, [">= 0"])
      s.add_development_dependency(%q<em-http-request>.freeze, [">= 0"])
      s.add_development_dependency(%q<juwelier>.freeze, [">= 0"])
    else
      s.add_dependency(%q<vertebrae>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<eventmachine>.freeze, [">= 0"])
      s.add_dependency(%q<em-synchrony>.freeze, [">= 0"])
      s.add_dependency(%q<em-http-request>.freeze, [">= 0"])
      s.add_dependency(%q<juwelier>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<vertebrae>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<eventmachine>.freeze, [">= 0"])
    s.add_dependency(%q<em-synchrony>.freeze, [">= 0"])
    s.add_dependency(%q<em-http-request>.freeze, [">= 0"])
    s.add_dependency(%q<juwelier>.freeze, [">= 0"])
  end
end

