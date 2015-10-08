require File.expand_path('../lib/vagrant-ip-show/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'vagrant-ip-show'
  s.version         = Vagrant::IpShow::VERSION
  s.date            = '2015-10-07'
  s.summary         = "List all ips of VM networks"
  s.description     = "A simple vagrant plugin for listing all ip of VM networks"
  s.authors         = ["Rogerio Prado de Jesus"]
  s.email           = 'rogeriopradoj@gmail.com'
  s.files           = `git ls-files`.split($\)
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths   = ['lib']
  s.homepage        = 'https://github.com/rogeriopradoj/vagrant-ip-show'
  s.license         = 'MIT'
end