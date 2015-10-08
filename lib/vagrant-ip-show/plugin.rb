# lib/vagrant-ip-show/plugin.rb
module Vagrant

    module IpShow

        class Plugin < Vagrant.plugin('2')
          name "IpShow"

          description <<-DESC
          This plugin runs ifconfig/ipconfig in order to return 'ip'(s) of all of the vm's networks
          DESC

          command 'ip-show' do
            require_relative 'command'
            Command
          end

        end
    end
end