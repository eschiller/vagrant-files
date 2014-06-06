class { 'apache':
  default_vhost => false,
}

# Non-ssl vhost
apache::vhost { 'first.example.com non-ssl':
  servername => 'first.example.com',
  port       => '80',
  docroot    => '/var/www/project',
}

# SSL vhost at the same domain
apache::vhost { 'first.example.com ssl':
  servername => 'first.example.com',
  port       => '443',
  docroot    => '/var/www/project',
  ssl        => true,
}
