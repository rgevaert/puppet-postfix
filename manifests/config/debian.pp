class postfix::config::debian
{
  file {
    '/etc/mailname':
      content => template('postfix/mailname.erb');
  }

  Class['postfix::config::debian'] ~> Class['postfix::service']

}
