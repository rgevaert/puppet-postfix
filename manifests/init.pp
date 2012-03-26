# Class: postfix
#
# This module manages postfix
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class postfix ( $root_alias,
                $mailname = $::fqdn,
                $postmaster = $root_alias) {

  include postfix::params
  include postfix::preinstall
  include postfix::install
  include postfix::config
  include postfix::service

  Class['postfix::params'] ->
    Class['postfix::preinstall'] ->
    Class['postfix::install'] ->
    Class['postfix::config'] ->
    Class['postfix::service']

  Class['postfix::params'] ~>
    Class['postfix::preinstall'] ~>
    Class['postfix::install'] ~>
    Class['postfix::config'] ~>
    Class['postfix::service']

}
