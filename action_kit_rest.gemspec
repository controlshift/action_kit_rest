# frozen_string_literal: true

require_relative "lib/action_kit_rest/version"

Gem::Specification.new do |spec|
  spec.name = "action_kit_rest"
  spec.version = ActionKitRest::VERSION::STRING
  spec.authors = ["Nathan Woodhull", "Diego Marcet", "Grey Moore", "Owens Ehimen"]
  spec.email = ["systems@controlshiftlabs.com"]

  spec.summary = "A wrapper for the ActionKit REST API"
  spec.description = "Gem for interacting with the ActionKit API"
  spec.homepage = "https://github.com/controlshift/action_kit_rest"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ spec/ .git .github .document .idea coverage/])
    end
  end
  spec.require_paths = ["lib"].freeze

  # Runtime dependencies
  spec.add_dependency "vertebrae", ">= 1.0.5"
  spec.add_dependency "faraday", "~> 2.0"  # We use Faraday 2.x APIs directly (Faraday::Middleware, etc.)
  spec.add_dependency "faraday-mashify", "~> 1.0"  # Required in lib/action_kit_rest/api.rb
  spec.add_dependency "hashie", ">= 5.0"

  # Development dependencies
  spec.add_development_dependency "bundler", ">= 2.0", "< 3.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "em-http-request", ">= 1.1.5", "< 2.0"
  spec.add_development_dependency "em-synchrony", ">= 1.0.6", "< 2.0"
  spec.add_development_dependency "eventmachine", ">= 1.2.5", "< 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "webmock", "~> 3.3"
end

