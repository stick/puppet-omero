class omero::java ($version = '1.6.0') {
  $java_packages = [
    "java-${version}-sun",
    "java-${version}-sun-devel",
  ]

  # I don't think we can 'officially' release packages for the sun jdk so we rely on the user to setup a repo
  case $operatingsystem {
    'RedHat', 'CentOS': {
      yumrepo { 'omero-java':
        baseurl  => hiera('omero-java-repo-url', 'file:///tmp/omero-java'),
        descr    => 'OMERO Java Packages',
        gpgcheck => '0',
      }
    }
    'Debian': {
    }
    'Ubuntu': {
    }
    default: {
    }
  }

  package { $java_packages:
    ensure  => 'installed',
    require => Yumrepo['omero-java'],
  }

  # update alternatives
}
