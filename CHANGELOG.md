# Changelog

## [0.4.11] - 2025-10-27

### Bugfixes
- Avoids a crash in error handling when ActionKit returns a response with a non-object "errors" value

## [0.4.10] - 2024-01-10

### Added
- Rather than raising StandardError when ActionKit returns a 500 response we now raise `ActionKitRest::Response::UnknownServerError` which is a subclass of StandardError.  This allows users to rescue from this specific error if they want to handle it differently than other errors.

