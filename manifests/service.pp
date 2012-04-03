class postfix::service
{
  service {
    'postfix':
      ensure  => running,
      name    => $postfix::service_name,
      enable  => true,
  }
}
