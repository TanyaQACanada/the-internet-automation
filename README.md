# The Internet Automation Project

This project contains automated tests for The Internet website and Restful Booker API using both RSpec and Cucumber frameworks.

[![CI](https://github.com/TanyaQACanada/the-internet-automation/actions/workflows/ci.yml/badge.svg)](https://github.com/TanyaQACanada/the-internet-automation/actions/workflows/ci.yml)

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

## Test Reports

### Cucumber Reports

This project uses Cucumber's reporting service. To enable report publishing:

1. For local development:
   ```bash
   # Set the token as an environment variable
   export CUCUMBER_PUBLISH_TOKEN=your_token_here
   
   # Or run Cucumber with the token
   CUCUMBER_PUBLISH_TOKEN=your_token_here bundle exec cucumber
   ```

2. For CI/CD:
   - The token is stored as a GitHub secret
   - Reports are automatically published when running in CI
   - View reports at: [Cucumber Reports](https://reports.cucumber.io)

### RSpec Reports

This project generates and publishes RSpec test reports:

1. For local development:
   ```bash
   # Generate XML report
   bundle exec rspec --format RspecJunitFormatter --out reports/rspec.xml
   ```

2. For CI/CD:
   - XML reports are automatically generated
   - Reports are published to GitHub Pages after each CI run
   - View latest report at: [RSpec Reports](https://tanyaqacanada.github.io/the-internet-automation/)

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
- rspec_junit_formatter
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

## Continuous Integration

This project uses GitHub Actions for continuous integration. The CI pipeline:

- Runs on every push to main branch and pull requests
- Uses Ubuntu latest as the runner
- Sets up Ruby 3.2
- Installs Chrome for Selenium tests
- Runs both RSpec and Cucumber tests

You can view the CI status and logs in the [Actions tab](https://github.com/TanyaQACanada/the-internet-automation/actions) of the repository. 