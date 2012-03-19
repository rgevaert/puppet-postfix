
define postfix::master ($type,
                        $private      = '-',
                        $unprivileged = '-',
                        $chroot       = '-',
                        $wakeup       = '-',
                        $limit        = '-',
                        $command      = $name)
{
  $service = $name

  # Augeas older than 0.10.0 has a typo in the postfix master lense
  $unpriv_lens = versioncmp($::augeasversion, '0.10.0') ? {
    '-1'      => 'unpriviliged',
    '0'       => 'unprivileged',
    '1'       => 'unprivileged',
  }

  if(versioncmp($::facterversion, '1.6') == -1 ) {
    fail('facter version < 1.6 not supported')
  }

  augeas {
    $name:
        context => '/files/etc/postfix/master.cf',
        changes => [
          "set ${service}/type ${type}",
          "set ${service}/private ${private}",
          "set ${service}/${unpriv_lens} ${unprivileged}",
          "set ${service}/chroot ${chroot}",
          "set ${service}/wakeup ${wakeup}",
          "set ${service}/limit ${limit}",
          "set ${service}/command '${command}'",
        ],
        notify  => Class['postfix::service'],
  }
}
