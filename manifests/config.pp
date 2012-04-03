class postfix::config
{

  $group_name = $::operatingsystem ? {
    'Solaris' => 'sys',
    default   => 'root'
  }

  file {
    $postfix::data_directory:
      ensure => directory,
      owner  => $postfix::daemon_uid,
      group  => $postfix::daemon_gid;
    $postfix::aliases_database:
      mode   => '0644',
      owner  => root,
      group  => root;
    '/etc/postfix':
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => $group_name;
  }


  postfix::mailalias {
    'root':
      recipient => $postfix::root_alias;
    'postmaster':
      recipient => $postfix::postmaster;
  }

  case $::operatingsystem {
    /(?i:Debian|Ubuntu)/: { include postfix::config::debian }
    default:               { }
  }

  exec {
    'newaliases':
      command      => '/usr/bin/newaliases',
      refreshonly  => true;
  }

}
