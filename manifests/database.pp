#
class omero::database inherits omero::settings {
  class { "omero::database::${omero::settings::dbtype}": }
}
