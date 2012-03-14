#
class omero::database inherits omero {
  $dbtype = hiera('dbtype')
  class { "omero::database::${dbtype}": }
}
