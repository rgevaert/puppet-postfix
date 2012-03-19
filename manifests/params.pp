class postfix::params
{
  $postfix_package = $::operatingsystem ? {
    'Solaris'                       => 'CNDpostfix',
    default                         => 'postfix',
  }

  $postfix_ldap_package = $::operatingsystem ? {
    /Ubuntu|Debian/                 => 'postfix-ldap',
    default                         => '',
  }

  $postfix_pcre_package = $::operatingsystem ? {
    /Ubuntu|Debian/                 => 'postfix-pcre',
    default                         => '',
  }

  $postfix_mysql_package = $::operatingsystem ? {
    /Ubuntu|Debian/                 => 'postfix-mysql',
    default                         => '',
  }

  $postfix_cdb_package = $::operatingsystem ? {
    /Ubuntu|Debian/                 => 'postfix-cdb',
    default                         => '',
  }

  $postfix_pgsql_package = $::operatingsystem ? {
    /Ubuntu|Debian/                 => 'postfix-pgsql',
    default                         => '',
  }

  $postfix_package_provider = $::operatingsystem ? {
    'Solaris'                       => 'pkgutil',
    /(?i:CentOS|RedHat|Scientific)/ => 'yum',
    /(?i:Debian|Ubuntu)/            => 'apt',
    default                         => 'postfix',
  }

  $mailx_package = $::operatingsystem ? {
    'Solaris'                       => undef,
    /(?i:CentOS|RedHat|Scientific)/ => 'mailx',
    /(?i:Debian|Ubuntu)/            => 'bsd-mailx',
  }

  $service_name = $::operatingsystem ? {
    default => 'postfix'
  }

  $daemon_uid = $::operatingsystem ? {
    default                         => 'postfix'
  }

  $daemon_gid = $::operatingsystem ? {
    'Solaris'                       => 'other',
    default                         => 'postfix'
  }

  $data_directory = $::operatingsystem ? {
    default                        => '/var/lib/postfix',
  }

  $aliases_database = $::operatingsystem ? {
    'Solaris'                       => '/etc/mail/aliases',
    default                         => '/etc/aliases'
  }
}
