define omero::config (
  $omero_user,
  $omero_home,
  $mode = 'set',
  $value = ''
) {

  Exec {
    path => [ '/bin', '/usr/bin', "${omero_home}/bin" ],
  }

  case $mode {
    'set': {
      exec { "set-${name}":
        command => "omero config set ${name} ${value}",
        unless  => "omero config get ${name} |grep -qs ${value}",
        user    => $omero_user,
      }
    }
    'get': {
      exec { "get-${name}":
        command => "omero config get ${name}",
        user    => $omero_user,
      }
    }
    default: {
    }
  }
}
