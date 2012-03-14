#
class omero inherits omero::settings {
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
