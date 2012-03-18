class postfix::install
{
  package {
    "${postfix::params::postfix_package}":
      provider => "${postfix::params::postfix_package_provider}",
      ensure   => installed;
  }

  if("${postfix::params::postfix_ldap_package}" != '')
  {
    package {
      "${postfix::params::postfix_ldap_package}":
        provider => "${postfix::params::postfix_package_provider}",
        ensure   => installed;
    }
  }

  if("${postfix::params::mailx_package}" != '')
  {
    package {
      "${postfix::params::mailx_package}":
        ensure => installed;
    }
  }
}
