define postfix::main ($value, $ensure = present)
{

  Augeas {
      context => '/files/etc/postfix/main.cf',
      require => Class['postfix'],
      notify  => Class['postfix::service'],
  }

  $context = $value ? {
    ''      => "clear ${name}",
    default => "set ${name} \'${value}\'",
  }

  case $ensure {
    present: {
      augeas {
        "enable ${name}":
          context => '/files/etc/postfix/main.cf',
          changes => $context,
      }
    }

    absent: {
      augeas {
        "disable postfix ${name}":
          context => '/files/etc/postfix/main.cf',
          changes => "rm ${name}",
      }
    }

    default: {
        fail('ensure must be present or absent')
      }

  }

}
