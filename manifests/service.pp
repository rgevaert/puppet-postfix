class postfix::service
{
  service {
    'postfix':
      ensure  => running,
      name    => $postfix::params::service_name,
      enable  => true,
  }
}
