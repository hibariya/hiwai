# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

require 'hiwai/version'

Gem::Specification.new do |s|
  s.name        = 'hiwai'
  s.version     = Hiwai::VERSION
  s.authors     = ['hibariya']
  s.email       = ['celluloid.key@gmail.com']
  s.homepage    = 'https://github.com/hibariya/hiwai'
  s.summary     = %q{detect hiwai string}
  s.description = %q{detect hiwai string in japanese}

  #s.rubyforge_project = "hiwai"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake', ['>= 0.9.2']
  s.add_development_dependency 'rspec', ['>= 2.6.0']
  s.add_development_dependency 'fuubar', ['>= 0.0.6']

end
