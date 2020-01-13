# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: action_kit_rest 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "action_kit_rest".freeze
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Woodhull".freeze, "Diego Marcet".freeze, "Jacinda Moore".freeze]
  s.date = "2020-01-13"
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
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "action_kit_rest.gemspec",
    "lib/action_kit_rest.rb",
    "lib/action_kit_rest/action.rb",
    "lib/action_kit_rest/actions/event_create_action.rb",
    "lib/action_kit_rest/actions/event_signup_action.rb",
    "lib/action_kit_rest/actions/unsubscribe_action.rb",
    "lib/action_kit_rest/allowed_user_field.rb",
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
    "spec/fixtures/allowed_user_field/get.json",
    "spec/fixtures/allowed_user_field/list.json",
    "spec/fixtures/allowed_user_field/list_filtered.json",
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
    "spec/lib/action_kit_rest/allowed_user_field_spec.rb",
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
  s.rubygems_version = "3.1.1".freeze
  s.summary = "A wrapper for the ActionKit REST API".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<vertebrae>.freeze, ["~> 0.5.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.3"])
    s.add_development_dependency(%q<byebug>.freeze, [">= 10.0.2", "< 11.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 2.0", "< 3.0"])
    s.add_development_dependency(%q<eventmachine>.freeze, [">= 1.2.5", "< 2.0"])
    s.add_development_dependency(%q<em-synchrony>.freeze, [">= 1.0.6", "< 2.0"])
    s.add_development_dependency(%q<em-http-request>.freeze, [">= 1.1.5", "< 2.0"])
    s.add_development_dependency(%q<juwelier>.freeze, [">= 2.4.9", "< 3.0"])
  else
    s.add_dependency(%q<vertebrae>.freeze, ["~> 0.5.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.3"])
    s.add_dependency(%q<byebug>.freeze, [">= 10.0.2", "< 11.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 2.0", "< 3.0"])
    s.add_dependency(%q<eventmachine>.freeze, [">= 1.2.5", "< 2.0"])
    s.add_dependency(%q<em-synchrony>.freeze, [">= 1.0.6", "< 2.0"])
    s.add_dependency(%q<em-http-request>.freeze, [">= 1.1.5", "< 2.0"])
    s.add_dependency(%q<juwelier>.freeze, [">= 2.4.9", "< 3.0"])
  end
end

