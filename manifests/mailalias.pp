define postfix::mailalias ($recipient, $ensure = 'present')
{
  mailalias {
    $name:
      ensure    => $ensure,
      recipient => $recipient,
      target    => $postfix::aliases_database,
      notify    => Exec['newaliases'],
  }
}
