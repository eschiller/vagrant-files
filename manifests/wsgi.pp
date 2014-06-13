class{'apache':
  default_vhost => false,
  require       => Exec["apt-get update"],
}

apache::vhost{"test":
  port            => '443',
  docroot         => '/var/www',
  ssl             => true,
  custom_fragment => "WSGIScriptAlias /projname /var/www/project/wsgi-scripts/projname.wsgi", 
      
  directories     => [ 
    { path               => '/var/www', 
      options            => ['FollowSymLinks', 'MultiViews']},
          
    { path               => "/var/www/project/wsgi-scripts", 
      custom_fragment    => 'WSGIApplicationGroup %{GLOBAL}', 
      order              => 'deny,allow', 
      allow              => 'from all'},
  ],

  require => File['/var/www/project/wsgi-scripts/projname.wsgi'],
}


file{"/var/www/project/wsgi-scripts/":
  ensure => 'directory',
}

file{"/var/www/project/wsgi-scripts/projname.wsgi":
  ensure  => present,
  source  => 'file:///vagrant/files/projname.wsgi',
  owner   => 'www-data',
  group   => 'www-data',
  require => File['/var/www/project/wsgi-scripts/'],
}

apache::mod {'wsgi':}

exec{"apt-get update":
  path => "/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin",
}
