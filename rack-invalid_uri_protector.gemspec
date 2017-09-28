# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rack/invalid_uri_protector/version"

Gem::Specification.new do |spec|
  spec.name          = "rack-invalid_uri_protector"
  spec.version       = Rack::InvalidUriProtector::VERSION
  spec.authors       = ["Shigeki Masuda"]
  spec.email         = ["macha3162@gmail.com"]

  spec.summary       = %q{Prevent annoying error reports of "invalid byte sequence in UTF-8"}
  spec.description   = %q{Protect invalid UTF8 characters from the URL and other env vars}
  spec.homepage      = "https://github.com/macha3162/rack-invalid_uri_protector"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test"
end
