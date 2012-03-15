#
class omero::web::nginx {
  package { 'nginx':
    name => 'nginx',
  }

  service { 'nginx':
    ensure     => 'running',
    enable     => 'true',
    hasrestart => 'true',
    hasstatus  => 'true',
    require    => Package['nginx'],
    restart    => '/sbin/service nginx reload'
  }
}
