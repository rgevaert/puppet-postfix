define postfix::mailalias ($recipient, $ensure = 'present')
{
  include postfix::params

  mailalias {
    $name:
      ensure    => $ensure,
      recipient => $recipient,
      target    => $postfix::params::aliases_database,
      notify    => Exec['newaliases'],
  }
}
