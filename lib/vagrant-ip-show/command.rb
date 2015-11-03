# lib/vagrant-ip-show/command.rb
module Vagrant
    module IpShow
        class Command < Vagrant.plugin('2', :command)

            def execute
                # Execute the actual SSH
                with_target_vms(nil, single_target: true) do |vm|

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
