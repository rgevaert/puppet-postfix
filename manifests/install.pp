class postfix::install
{
  package {
    $postfix::postfix_package:
      ensure   => installed,
      provider => $postfix::postfix_package_provider;
  }

  if($postfix::postfix_ldap_package != '')
  {
    package {
      $postfix::postfix_ldap_package:
        ensure   => installed,
        provider => $postfix::postfix_package_provider;
    }
  }

  if($postfix::postfix_mysql_package != '')
  {
    package {
      $postfix::postfix_mysql_package:
        ensure   => installed,
        provider => $postfix::postfix_package_provider;
    }
  }

  if($postfix::postfix_cdb_package != '')
  {
    package {
      $postfix::postfix_cdb_package:
        ensure   => installed,
        provider => $postfix::postfix_package_provider;
    }
  }

  if($postfix::postfix_pcre_package != '')
  {
    package {
      $postfix::postfix_pcre_package:
        ensure   => installed,
        provider => $postfix::postfix_package_provider;
    }
  }

  if($postfix::postfix_pgsql_package != '')
  {
    package {
      $postfix::postfix_pgsql_package:
        ensure   => installed,
        provider => $postfix::postfix_package_provider;
    }
  }

  if($postfix::mailx_package != '')
  {
    package {
      $postfix::mailx_package:
        ensure => installed;
    }
  }
}
