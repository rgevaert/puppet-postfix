class {
  'postfix':
    root_alias => $::id;
}

postfix::main {
  'inet_interfaces':
    value => 'loopback-only';
  'message_size_limit':
    value => '12288000';
  'recipient_delimiter':
    value => '+';
  'mynetworks':
    value => '127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128';
  'relayhost':
    value => "smtp.${::domain}";
  'mydomain':
    value  => $::domain,
  'mydestination':
    value  => '$myhostname';
  'mailbox_size_limit':
    value  => '0';
  # appending .domain is the MUA's job.
  'append_dot_mydomain':
    value  => 'no';
}

