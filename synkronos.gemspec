# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'synkronos/version'

Gem::Specification.new do |spec|
  spec.name          = "synkronos"
  spec.version       = Synkronos::VERSION
  spec.authors       = ["Artyom Khramov"]
  spec.email         = ["futu.fata@gmail.com"]
  spec.summary       = %q{Synchronize your folders with synkronos }
  spec.description   = <<-EOS 
    Synkronos is a life-time folder synchronization tool. 
    It's based on rsync and works only under MacOSX yet.
  EOS
  
  spec.homepage      = "https://github.com/akhramov/synkronos"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.bindir = 'bin'
  spec.executables << 'synkronos'
  
  spec.add_development_dependency "bundler", '~> 1.6', ">= 1.6"
  spec.add_development_dependency "rake", '~> 10.0', '>= 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0.0', '>= 3.0.0'
  
  spec.required_ruby_version = '>= 1.8.6'
  spec.extensions = 'ext/mkrf_conf.rb'
end
