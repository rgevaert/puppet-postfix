define postfix::map ( $ensure   = present,
                      $maptype  = 'none',
                      $template = "${name}.erb")
{
  $mapname = $name

  $map_notify = $ensure ? {
    present => Exec["postmap /etc/postfix/${mapname}"],
    absent  => undef,
  }

  file {
    "/etc/postfix/${mapname}":
        ensure  => $ensure,
        owner   => root,
        group   => root,
        mode    => '0755',
        notify  => $map_notify,
        content => template($template);
  }

  $postmap_command = $maptype ?  {
    'none'      => 'echo no update necessary',
    'pcre'      => 'echo no update necessary',
    default     => "postmap ${maptype}:/etc/postfix/${mapname}",
  }

  exec {
    "postmap /etc/postfix/${mapname}":
      command     => $postmap_command,
      path        => '/bin:/usr/sbin:/opt/csw/sbin',
      refreshonly => true,
      notify      => Class['postfix::service'];
  }
}
