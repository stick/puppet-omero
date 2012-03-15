#
class omero::web::apache {
  package {
    'httpd':
      name => 'httpd',
      ;
    'mod_fastcgi':
      name => 'mod_fastcgi',
      ;
  }

  service { 'httpd':
    ensure     => 'running',
    hasstatus  => 'true',
    hasrestart => 'true',
    require    => Package['httpd'],
    restart    => '/sbin/service httpd graceful',
  }
}
