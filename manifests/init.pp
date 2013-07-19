# = Class: snmpd
#
# This is the main snmpd class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, snmpd class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $snmpd_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, snmpd main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $snmpd_source
#
# [*source_dir*]
#   If defined, the whole snmpd configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $snmpd_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $snmpd_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, snmpd main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $snmpd_template
#
# [*content*]
#   Defines the content of the main configuration file, to be used as alternative
#   to template when the content is populated on other ways.
#   If defined, snmpd main config file has: content => $content
#   Note: source, template and content are mutually exclusive.
#   If a template is defined, that has precedence on the content parameter
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $snmpd_options
#
# [*service_autorestart*]
#   Automatically restarts the snmpd service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $snmpd_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $snmpd_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $snmpd_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $snmpd_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for snmpd checks
#   Can be defined also by the (top scope) variables $snmpd_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $snmpd_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $snmpd_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $snmpd_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $snmpd_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for snmpd port(s)
#   Can be defined also by the (top scope) variables $snmpd_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling snmpd. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $snmpd_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $snmpd_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $snmpd_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $snmpd_audit_only
#   and $audit_only
#
# Default class params - As defined in snmpd::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of snmpd package
#
# [*service*]
#   The name of snmpd service
#
# [*service_status*]
#   If the snmpd service init script supports status argument
#
# [*process*]
#   The name of snmpd process
#
# [*process_args*]
#   The name of snmpd arguments. Used by puppi and monitor.
#   Used only in case the snmpd process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user snmpd runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $snmpd_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $snmpd_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include snmpd"
# - Call snmpd as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class snmpd (
  $snmpname            = params_lookup( 'snmpname' ),
  $snmplocation        = params_lookup( 'snmplocation' ),
  $snmpcontact         = params_lookup( 'snmpcontact' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $content             = params_lookup( 'content' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits snmpd::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $snmpd::bool_absent ? {
    true  => 'absent',
    false => $snmpd::version,
  }

  $require_package = $snmpd::package ? {
    ''      => undef,
    default => Package['snmpd'],
  }

  $manage_service_enable = $snmpd::bool_disableboot ? {
    true    => false,
    default => $snmpd::bool_disable ? {
      true    => false,
      default => $snmpd::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $snmpd::bool_disable ? {
    true    => 'stopped',
    default =>  $snmpd::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $snmpd::bool_service_autorestart ? {
    true    => Service[snmpd],
    false   => undef,
  }

  $manage_file = $snmpd::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $snmpd::bool_absent == true
  or $snmpd::bool_disable == true
  or $snmpd::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $snmpd::bool_absent == true
  or $snmpd::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $snmpd::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $snmpd::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $snmpd::source ? {
    ''        => undef,
    default   => $snmpd::source,
  }

  $manage_file_content = $snmpd::template ? {
    ''        => $snmpd::content ? {
      ''      => undef,
      default => $snmpd::content,
    },
    default   => template($snmpd::template),
  }

  ### Managed resources
  if $snmpd::package {
    package { $snmpd::package:
      ensure => $snmpd::manage_package,
    }
  }

  service { 'snmpd':
    ensure     => $snmpd::manage_service_ensure,
    name       => $snmpd::service,
    enable     => $snmpd::manage_service_enable,
    hasstatus  => $snmpd::service_status,
    pattern    => $snmpd::process,
    require    => $require_package,
  }

  file { 'snmpd.conf':
    ensure  => $snmpd::manage_file,
    path    => $snmpd::config_file,
    mode    => $snmpd::config_file_mode,
    owner   => $snmpd::config_file_owner,
    group   => $snmpd::config_file_group,
    require => $require_package,
    notify  => $snmpd::manage_service_autorestart,
    source  => $snmpd::manage_file_source,
    content => $snmpd::manage_file_content,
    replace => $snmpd::manage_file_replace,
    audit   => $snmpd::manage_audit,
  }

  # The whole snmpd configuration directory can be recursively overriden
  if $snmpd::source_dir {
    file { 'snmpd.dir':
      ensure  => directory,
      path    => $snmpd::config_dir,
      require => $require_package,
      notify  => $snmpd::manage_service_autorestart,
      source  => $snmpd::source_dir,
      recurse => true,
      purge   => $snmpd::bool_source_dir_purge,
      replace => $snmpd::manage_file_replace,
      audit   => $snmpd::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $snmpd::my_class {
    include $snmpd::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $snmpd::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'snmpd':
      ensure    => $snmpd::manage_file,
      variables => $classvars,
      helper    => $snmpd::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $snmpd::bool_monitor == true {
    if $snmpd::port != '' and $snmpd::protocol == 'tcp' {
      monitor::port { "snmpd_${snmpd::protocol}_${snmpd::port}":
        protocol => $snmpd::protocol,
        port     => $snmpd::port,
        target   => $snmpd::monitor_target,
        tool     => $snmpd::monitor_tool,
        enable   => $snmpd::manage_monitor,
      }
    }
    if $snmpd::service != '' {
      monitor::process { 'snmpd_process':
        process  => $snmpd::process,
        service  => $snmpd::service,
        pidfile  => $snmpd::pid_file,
        user     => $snmpd::process_user,
        argument => $snmpd::process_args,
        tool     => $snmpd::monitor_tool,
        enable   => $snmpd::manage_monitor,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $snmpd::bool_firewall == true and $snmpd::port != '' {
    firewall { "snmpd_${snmpd::protocol}_${snmpd::port}":
      source      => $snmpd::firewall_src,
      destination => $snmpd::firewall_dst,
      protocol    => $snmpd::protocol,
      port        => $snmpd::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $snmpd::firewall_tool,
      enable      => $snmpd::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $snmpd::bool_debug == true {
    file { 'debug_snmpd':
      ensure  => $snmpd::manage_file,
      path    => "${settings::vardir}/debug-snmpd",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
