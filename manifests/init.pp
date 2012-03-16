#
class omero (
  $omero_owner = hiera('omero_owner'),
  $omero_group = hiera('omero_group'),
  $omero_home = hiera('omero_home'),
  $create_omero_user = hiera('create_omero_user'),
  $epel_release_rpm = hiera('epel_release_rpm'),
) {

  if $create_omero_user {
    user { $omero_owner:
      ensure  => 'present',
      home    => $omero_home,
      comment => "OMERO User",
    }

    group { $omero_group:
      ensure => 'present',
    }
  }

  # we need epel, it may be installed b/c of puppet but possible not enabled.
  if defined(Yumrepo['epel']) {
    notice "epel appears to be defined"
    Yumrepo['epel'] {
      enabled => '1',
    }
  } else {
    yumrepo { 'epel':
      enabled => '1',
      require => Package['epel-release'],
    }

    package { 'epel-release':
      source   => $epel_release_rpm,
      provider => 'rpm',
    }
  }

  file {
    'omero-profile.sh':
      path    => '/etc/profile.d/omero.sh',
      content => template("${module_name}/omero-profile.sh.erb"),
      ;
    'omero-profile.csh':
      path    => '/etc/profile.d/omero.csh',
      content => template("${module_name}/omero-profile.csh.erb"),
      ;
  }
}
