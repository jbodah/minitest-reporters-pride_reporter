# minitest-reporters-pride_reporter
minitest-pride integration for minitest-reporters

## Usage

I'm currently holding off to gemify this as an experiment for (gemmy_rb)[https://github.com/jbodah/gemmy_rb].

Here's the basic gist of the code:

```rb
require 'minitest/pride_plugin'
require 'minitest/reporters'

module Minitest::Reporters
  class PrideReporter < DefaultReporter
    def initialize(options = {})
      super
      @pride_io = Minitest::PrideLOL.new($stdout)
    end

    def record(test)
      # Bypass super and call super's super
      self.class.superclass.superclass
                .instance_method(:record).bind(self).call(test)

      print "#{"%.2f" % test.time} = " if options[:verbose]

      @pride_io.print(test.result_code)

      if @fast_fail && (test.skipped? || test.failure)
        puts
        print_failure(test)
      end
    end
  end
end

if ENV['REPORTER'] == 'pride'
  reporter = Minitest::Reporters::PrideReporter.new(fast_fail: true, slow_count: 20)
  Minitest::Reporters.use!(reporter)
end
```
