# Changelog

## [0.4.10] - 2024-01-10

### Added
- Rather than raising StandardError when ActionKit returns a 500 response we now raise `ActionKitRest::Response::UnknownServerError` which is a subclass of StandardError.  This allows users to rescue from this specific error if they want to handle it differently than other errors.

