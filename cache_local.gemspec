lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cache_local'

Gem::Specification.new do |spec|
  spec.name          = 'cache_local'
  spec.version       = CacheLocal::VERSION
  spec.authors       = ['Kei Tsuchiya']
  spec.email         = ['kei.tsuchiya86@gmail.com']
  spec.description   = %q{Simple local cache}
  spec.summary       = %q{Enable to cache using file or process}
  spec.homepage      = 'https://github.com/kei500/cache_local'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3'
end
