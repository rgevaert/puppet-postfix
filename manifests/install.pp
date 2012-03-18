class postfix::install
{
  package {
    $postfix::params::postfix_package:
      ensure   => installed,
      provider => $postfix::params::postfix_package_provider;
  }

  if($postfix::params::postfix_ldap_package != '')
  {
    package {
      $postfix::params::postfix_ldap_package:
        ensure   => installed,
        provider => $postfix::params::postfix_package_provider;
    }
  }

  if($postfix::params::mailx_package != '')
  {
    package {
      $postfix::params::mailx_package:
        ensure => installed;
    }
  }
}
