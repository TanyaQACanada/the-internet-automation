# The Internet Automation Project

This project contains automated tests for The Internet website and Restful Booker API using both RSpec and Cucumber frameworks.

## Quick Start - Running Tests

### RSpec Tests

Run all RSpec tests:
```bash
bundle exec rspec
```

Run specific test files:
```bash
# Run Restful Booker API tests
bundle exec rspec spec/restful_booker_spec.rb
```

Run with documentation format:
```bash
bundle exec rspec --format documentation
```

### Cucumber Tests

Run all Cucumber tests:
```bash
bundle exec cucumber
```

Run specific features:
```bash
# Run login tests
bundle exec cucumber features/login.feature

# Run digest authentication tests
bundle exec cucumber features/digest_auth.feature

# Run secure area tests
bundle exec cucumber features/secure_area.feature
```

Run tests with specific tags:
```bash
bundle exec cucumber --tags @tag_name
```

## Prerequisites

- Ruby (latest stable version recommended)
- Bundler gem (`gem install bundler`)

## Setup

1. Clone the repository:
```bash
git clone https://github.com/TanyaQACanada/the-internet-automation.git
cd the-internet-automation
```

2. Install dependencies:
```bash
bundle install
```

## Project Structure

- `features/` - Contains Cucumber feature files and step definitions
  - `login.feature` - Login functionality tests
  - `digest_auth.feature` - Digest authentication tests
  - `secure_area.feature` - Secure area access tests
  - `step_definitions/` - Step definition files
  - `support/` - Support files and hooks
- `spec/` - Contains RSpec test files
  - `restful_booker_spec.rb` - Restful Booker API tests
  - `spec_helper.rb` - RSpec configuration
- `lib/` - Contains the main application code and API client
- `Gemfile` - Lists all project dependencies

## Dependencies

- cucumber (~> 8.0)
- selenium-webdriver (~> 4.0)
- rspec
- webdrivers
- page-object
- ffi
- httparty
- json

## Contributing

1. Create a new branch for your feature
2. Make your changes
3. Run the tests to ensure everything works
4. Submit a pull request

## License

[Add your license information here] 