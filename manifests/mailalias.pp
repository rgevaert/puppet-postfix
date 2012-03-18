define postfix::mailalias ($ensure = "present", $recipient)
{
  include postfix::params

  mailalias {
    "${name}":
      ensure    => $ensure,
      recipient => "${recipient}",
      target    => "${postfix::params::aliases_database}",
      notify    => Exec["newaliases"],
  }
}
