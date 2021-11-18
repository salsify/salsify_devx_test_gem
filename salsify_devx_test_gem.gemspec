# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salsify_devx_test_gem/version'

Gem::Specification.new do |spec|
  spec.name          = 'salsify_devx_test_gem'
  spec.version       = DevxTestGem::VERSION
  spec.authors       = ['Salsify, Inc']
  spec.email         = ['engineering@salsify.com']

  spec.summary       = 'Public gem to test release tooling for rubygems.org'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/salsify/salsify_devx_test_gem'

  spec.license       = 'MIT'


  # Set 'allowed_push_post' to control where this gem can be published.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    spec.metadata['rubygems_mfa_required'] = 'true'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.5'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'

  spec.add_development_dependency 'salsify_rubocop', '~> 1.0'
end
