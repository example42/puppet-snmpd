# Puppet module: snmpd

This is a Puppet module for snmpd based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-snmpd

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Basic management

* Install snmpd with working defaults:

        class { 'snmpd':
          template     => 'snmpd/snmpd.conf.erb',
          snmplocation => 'Building 4, Rack 12',
          snmpcontact  => 'noc@company.example42',
          options      => {
            'com2sec readonly default'        => 'public',
            'group MyROGroup v1'              => 'readonly',
            'group MyROGroup v2c'             => 'readonly',
            'group MyROGroup usm'             => 'readonly',
            'view all    included  .1'        => '80',
            'access MyROGroup ""'             => 'any       noauth    exact  all    none   none',
            'extend .1.3.6.1.4.1.2021.7890.1' => 'distro /usr/bin/distro # Observium: host os detection',
            'dontLogTCPWrappersConnects'      => 'true # To keep "snmpd[3458]: Connection from UDP: [127.0.0.1]:48911" from filling your logs'
          }
        }

* Install snmpd with default settings

        class { 'snmpd': }

* Install a specific version of snmpd package

        class { 'snmpd':
          version => '1.0.1',
        }

* Disable snmpd service.

        class { 'snmpd':
          disable => true
        }

* Remove snmpd package

        class { 'snmpd':
          absent => true
        }

* Enable auditing without without making changes on existing snmpd configuration files

        class { 'snmpd':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'snmpd':
          source => [ "puppet:///modules/example42/snmpd/snmpd.conf-${hostname}" , "puppet:///modules/example42/snmpd/snmpd.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'snmpd':
          source_dir       => 'puppet:///modules/example42/snmpd/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'snmpd':
          template => 'example42/snmpd/snmpd.conf.erb',
        }

* Automatically include a custom subclass

        class { 'snmpd':
          my_class => 'example42::my_snmpd',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'snmpd':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'snmpd':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'snmpd':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'snmpd':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-snmpd.png?branch=master)](https://travis-ci.org/example42/puppet-snmpd)
