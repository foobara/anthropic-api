## [1.0.0] - 2025-07-08

- Retry with incremental/exponential backoff for 529s and 429s

## [0.0.11] - 2025-06-27

- Add temperature input to CreateMessage

## [0.0.10] - 2025-03-04

- Fix bug where system prompt is not properly sent up to Anthropic

## [0.0.9] - 2025-03-01

- Rename :model to :model_enum to avoid collision with Model in filesystems that are case-insensitive

## [0.0.8] - 2025-02-19

- Cache the list of models in ListModels
- Load valid models at boot time into ModelEnum

## [0.0.7] - 2025-02-18

- Add a ModelEnum and update list of models

## [0.0.6] - 2025-02-17

- Make sure new API attributes that Anthropic adds to their API retroactively don't break our models
  before we have a chance to add the new attributes.
- Add GetPageOfModels and ListModels commands
- Allow setting the api token on the project module

## [0.0.3] - 2025-01-07

- Bump Ruby to 3.4.1

## [0.0.2] - 2024-08-19

- Add 3.5 Sonnet model

## [0.0.1] - 2024-04-01

- Initial release
