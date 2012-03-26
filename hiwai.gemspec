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

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| file.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'rake', ['>= 0.9.2']
  s.add_development_dependency 'rspec', ['>= 2.6.0']
end
