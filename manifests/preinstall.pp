class postfix::preinstall
{
  case $::operatingsystem {
      /Solaris/:  { include postfix::preinstall::solaris}
      default:    { include postfix::preinstall::default}
  }
}
