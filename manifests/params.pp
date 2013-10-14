# Class: snmpd::params
#
# This class defines default parameters used by the main module class snmpd
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to snmpd class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class snmpd::params {

  $snmpname = $::fqdn
  $snmplocation = ''
  $snmpcontact = ''

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Solaris)/                               => $::operatingsystemrelease ? {
      '5.10' => [ 'SUNWsmmgr' , 'SUNWsmagt' , 'SUNWsasnm' , 'SUNWsacom' ],
      '5.11' => 'net-snmp',
    },
    /(?i:RedHat|Centos|Scientific|Linux|Amazon)/ => 'net-snmp',
    /(?i:OpenBSD)/                               => 'net-snmp',
    default                                      => 'snmpd',
  }

  $service = $::operatingsystem ? {
    /(?i:Solaris)/ => $::operatingsystemrelease ? {
      '5.10' => 'snmpx',
      '5.11' => 'net-snmp',
    },
    /(?i:OpenBSD)/ => 'netsnmpd',
    default        => 'snmpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'snmpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:Solaris)/  => $::operatingsystemrelease ? {
      '5.10' => '/etc/snmp/conf',
      '5.11' => '/etc/net-snmp/snmp',
    },
    /(?i:OpenBSD)/ => '/etc/snmp',
    default        => '/etc/snmpd',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Solaris)/  => $::operatingsystemrelease ? {
      '5.10' => '/etc/snmp/conf/snmpd.conf',
      '5.11' => '/etc/net-snmp/snmp/snmpd.conf',
    },
    default         => '/etc/snmp/snmpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    /(?i:Solaris)/ => '0444',
    /(?i:Debian)/  => '0600',
    default        => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:Solaris)/ => 'bin',
    /(?i:OpenBSD)/ => 'wheel',
    default        => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/                    => '/etc/default/snmpd',
    /(?i:RedHat|Centos|Scientific|Linux|Amazon)/ => '/etc/sysconfig/snmpd.options',
    /(?i:OpenBSD)/                               => '',
    default                                      => '/etc/sysconfig/snmpd',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/snmpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  $port = '161'
  $protocol = 'udp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $content = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
