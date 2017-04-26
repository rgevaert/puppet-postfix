# Define postfix::mailalias
# Configure an mail alias
#
define postfix::mailalias ($recipient, $ensure = 'present')
{
  mailalias {
    $name:
      ensure    => $ensure,
      recipient => $recipient,
      target    => $postfix::aliases_database,
      notify    => Exec["newaliases-${recipient}"],
  }

  exec { "newaliases-${recipient}-${name}":
    command      => '/usr/bin/newaliases',
    refreshonly  => true;
  }

}
