# Changelog

## [0.4.12] - 2026-02-09

### Changed
- Upgraded to Ruby 4.0.1 compatibility
- Upgraded Faraday from 1.x to 2.14.1 for Ruby 4.0+ support
- Upgraded Vertebrae from 0.8.0 to 1.0.5
- Upgraded Hashie from 3.6.0 to 5.1.0
- Removed juwelier dependency in favor of standard Bundler gem tasks
- Updated Faraday middleware to use Faraday 2.x API

## [0.4.11] - 2025-10-27

### Bugfixes
- Avoids a crash in error handling when ActionKit returns a response with a non-object "errors" value

## [0.4.10] - 2024-01-10

### Added
- Rather than raising StandardError when ActionKit returns a 500 response we now raise `ActionKitRest::Response::UnknownServerError` which is a subclass of StandardError.  This allows users to rescue from this specific error if they want to handle it differently than other errors.

