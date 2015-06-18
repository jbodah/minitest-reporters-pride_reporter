require_relative 'lib/minitest/reporters/pride_reporter'

Gem::Specification.new do |s|
  s.name        = 'minitest-reporters-pride_reporter'
  s.version     = Minitest::Reporters::PrideReporter::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'minitest-pride integration for minitest-reporters'
  s.description = 'Love minitest-pride but wish it had all of the features of minitest-reporters? This is for you!'
  s.authors     = ['["Josh Bodah"]']
  s.email       = 'jb3689@yahoo.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/jbodah/minitest-reporters-pride_reporter'

  s.add_development_dependency 'rake', '~>0'

  s.add_dependency 'minitest', '~>5'
  s.add_dependency 'minitest-reporters', '~>1'
end

