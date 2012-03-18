class postfix::service
{
  service {
    "postfix":
      name => "${postfix::params::service_name}",
      ensure  => running,
      enable  => true,
  }
}
