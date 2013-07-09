# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unitop'

Gem::Specification.new do |spec|
  spec.name          = "unitop"
  spec.version       = Unitop::Version::VERSION
  spec.authors       = ["Denis Redozubov"]
  spec.email         = ["denis.redozubov@gmail.com"]
  spec.description   = %q{Configurable ps on drugs}
  spec.summary       = %q{Friendly wrapper for sys-proctable, configurable on per-project basis}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~>2.0.0"

  spec.add_dependency "sys-proctable"
end
