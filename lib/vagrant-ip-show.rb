# lib/vagrant-ip-show.rb
require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'vagrant-ip-show/plugin'
require 'vagrant-ip-show/command'