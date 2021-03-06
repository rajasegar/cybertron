lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cybertron/version"

Gem::Specification.new do |spec|
  spec.name          = "cybertron"
  spec.version       = Cybertron::VERSION
  spec.authors       = ["Rajasegar"]
  spec.email         = ["rajasegar.c@gmail.com"]

  spec.summary       = "Create Ruby Transformers from Cybertron"
  spec.description   = "Cybertron is a Ruby CLI to create codemods"
  spec.homepage      = "https://github.com/rajasegar/cybertron"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'parser', '~> 2.6'
  spec.add_runtime_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
