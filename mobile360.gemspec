require_relative 'lib/mobile360/version'

Gem::Specification.new do |spec|
  spec.name          = 'mobile360'
  spec.version       = Mobile360::VERSION
  spec.authors       = ['Nujian Den Mark Meralpis']
  spec.email         = ['denmarkmeralpis@gmail.com']
  spec.summary       = %q{A ruby wrapper for sending SMS using mobile360 platform}
  spec.description   = %q{Consumming Mobile360 plafrom's API}
  spec.homepage      = 'https://github.com/denmarkmeralpis/mobile360'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.metadata['allowed_push_host'] = 'https://github.com/denmarkmeralpis/mobile360'
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'dotenv', '~> 2.5'
  spec.add_development_dependency 'rails', '~> 5.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.4'
end
