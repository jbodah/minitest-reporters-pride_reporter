require 'minitest/reporters'
require 'minitest/pride_plugin'

module Minitest::Reporters
  class PrideReporter < DefaultReporter
    VERSION = '0.0.1a'

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
