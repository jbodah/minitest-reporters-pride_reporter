# minitest-reporters-pride_reporter

minitest-pride integration for [minitest-reporters](https://github.com/kern/minitest-reporters)

## Installation

```
gem install minitest-reporters-pride_reporter
```

## Usage

```rb
require 'minitest/reporters/pride_reporter'

if ENV['REPORTER'] == 'pride'
  reporter = Minitest::Reporters::PrideReporter.new(fast_fail: true, slow_count: 20)
  Minitest::Reporters.use!(reporter)
end
```
