class postfix::preinstall::solaris
{

    Exec['disable_sendmail_root'] ->
    Exec['disable_sendmail_usr'] ->
    Exec['kill_sendmail'] ->
    Package['SUNWsndmu'] ->
    Package['SUNWsndmr']

  file {
    'adminfile':
      ensure => present,
      path   => '/var/sadm/install/admin/puppet-postfix',
      source => 'puppet:///modules/postfix/solaris_adminfile';
  }

  Exec {
    path => '/usr/sbin/:/usr/bin'
  }
  exec {
    'disable_sendmail_root':
      command => 'svcadm disable sendmail',
      onlyif  => 'pkginfo -q SUNWsndmr';
    'disable_sendmail_usr':
      command => 'svcadm disable sendmail',
      onlyif  => 'pkginfo -q SUNWsndmu';
    'kill_sendmail':
      command => 'pkill sendmail',
      onlyif  => 'pgrep sendmail';
  }

  package {
    ['SUNWsndmu','SUNWsndmr']:
      ensure    => absent,
      provider  => sun,
      require   => File['adminfile'],
      adminfile => '/var/sadm/install/admin/puppet-postfix';
  }
}
