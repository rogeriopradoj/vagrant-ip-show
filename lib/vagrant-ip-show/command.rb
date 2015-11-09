# lib/vagrant-ip-show/command.rb
module Vagrant
    module IpShow
        class Command < Vagrant.plugin('2', :command)
		def self.synopsis
			"show all VM ip addresses"
		end

		def execute
			options = {}
			opts = OptionParser.new do |o|
			o.banner = "Usage: vagrant ip-show [vmname]"
			o.separator ""
			o.separator "Options:"
			o.separator ""
		end

		# Parse the options and return if we don't have any target.
		argv = parse_options(opts)
		return if !argv

                # Execute the actual SSH
                with_target_vms(argv, single_target: true) do |vm|
                    @logger.info("Getting ips of vm networks")
                    ssh_opts = {extra_args: ['-q']} # make it quiet
                    env = vm.action(:ssh_run, ssh_run_command: "/sbin/ifconfig | grep 'inet addr:' | grep -v 127.0.0.1 | sed -e 's/Bcast//' | cut -d: -f2", ssh_opts: ssh_opts)
                    status = env[:ssh_run_exit_status] || 0
                    return status
                end
            end
        end
    end 
end
