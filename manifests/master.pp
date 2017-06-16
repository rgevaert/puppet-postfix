# Define: postfix::master
# Set a config line in master.cf
#
define postfix::master ($type,
                        $ensure       = 'present',
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
    -1 => 'unpriviliged',
    0  => 'unprivileged',
    1  => 'unprivileged',
  }

  if(versioncmp($::facterversion, '1.6') == -1 ) {
    fail('facter version < 1.6 not supported')
  }

  $changes = $ensure ? {
    'present' => [
          "set type ${type}",
          "set private ${private}",
          "set ${unpriv_lens} ${unprivileged}",
          "set chroot ${chroot}",
          "set wakeup ${wakeup}",
          "set limit ${limit}",
          "set command '${command}'", ],
    'absent' => [ "rm ."],
  }

  augeas {
    "${service}-${type}":
        context => "/files/etc/postfix/master.cf/$service[ type = '$type' ]",
        changes => $changes,
  }

}
