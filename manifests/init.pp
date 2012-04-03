# Class: postfix
#
# This module manages postfix
#
# Parameters:
#  root_alias: where email needs to be redirected for root
#  mailname:   (specific for Debian)
#  postmaster: forwarding adres, default is root_alias
#
# Actions:
#
# Requires: Puppet 2.7.11 and augeas 0.10
#
# Sample Usage:
# class {
#   'postfix':
#     root_alias => 'myaccount@mydomain.com';
# }
#
class postfix (
  $root_alias,
  $mailname                 = $::fqdn,
  $postmaster               = $root_alias,

  $postfix_package          = $postfix::params::postfix_package,
  $postfix_ldap_package     = $postfix::params::postfix_ldap_package,
  $postfix_pcre_package     = $postfix::params::postfix_pcre_package,
  $postfix_mysql_package    = $postfix::params::postfix_mysql_package,
  $postfix_cdb_package      = $postfix::params::postfix_cdb_package,
  $postfix_pgsql_package    = $postfix::params::postfix_pgsql_package,
  $postfix_package_provider = $postfix::params::postfix_package_provider,
  $mailx_package            = $postfix::params::mailx_package,
  $service_name             = $postfix::params::service_name,
  $daemon_uid               = $postfix::params::daemon_uid,
  $daemon_gid               = $postfix::params::daemon_gid,
  $data_directory           = $postfix::params::data_directory,
  $aliases_database         = $postfix::params::aliases_database
) inherits postfix::params {

    class{'postfix::preinstall':} ~>
    class{'postfix::install':} ~>
    class{'postfix::config':} ~>
    class{'postfix::service':}

}
