# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unitop/version'

Gem::Specification.new do |spec|
  spec.name          = "unitop"
  spec.version       = Unitop::VERSION
  spec.authors       = ["Denis Redozubov"]
  spec.email         = ["denis.redozubov@gmail.com"]
  spec.description   = %q{External ProcTable-based monitoring tool for preforking servers and other stuff}
  spec.summary       = %q{TODO: }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
