
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "subox_api/version"

Gem::Specification.new do |spec|
  spec.name          = "subox_api"
  spec.version       = SuboxApi::VERSION
  spec.authors       = ["Denis <Zaratan> Pasin"]
  spec.email         = ["denis@pasin.fr"]

  spec.summary       = 'A gem to interface with api.subox.co'
  spec.homepage      = "https://github.com/denispasin/subox_api"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency 'faker'
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "nyan-cat-formatter"
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "rubocop", "= 0.52.1"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency "vcr"
end
