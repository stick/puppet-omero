#
class omero::ice {
  $ice_packages = [
    'ice',
    'ice-python',
    'ice-servers',
    'ice-libs',
    'ice-utils',
    'ice-java-devel',
    'ice-python-devel',
    'ice-java',
  ]

  yumrepo { 'zeroc-ice':
    baseurl  => hiera('zeroc-ice-repo-url', "http://www.glencoesoftware.com/ice-rpms/6/"),
    descr    => 'ZeroC Ice Packages',
    gpgcheck => '0',
  }

  package { $ice_packages:
    ensure  => 'installed',
    require => Yumrepo['zeroc-ice'],
  }
}
