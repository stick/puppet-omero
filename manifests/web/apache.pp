# stubb class for apache configuration of omero web
class omero::web::apache (
  $config = hiera('apache_config_file'),
  $omero_owner = hiera('omero_owner'),
  $omero_home = hiera('omero_home'),
) {
  package {
    'httpd':
      name => 'httpd',
      ;
    'mod_fastcgi':
      name => 'mod_fastcgi',
      ;
  }

  exec { 'generate-apache-config':
    command => "omero web config apache > ${config}",
    path    => [ '/bin', '/usr/bin', "${omero_home}/bin" ],
    user    => $omero_owner,
    creates => $config,
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  service { 'httpd':
    ensure     => 'running',
    hasstatus  => 'true',
    hasrestart => 'true',
    require    => Package['httpd'],
    restart    => '/sbin/service httpd graceful',
  }
}
