# settings class
# other classes/types can reference vars from here
# all vars should be hiera lookups to allow overrides
#
class omero::settings {
  $omero_home = hiera('omero_home')
  $ice_home = hiera('ice_home')
  $webtype = hiera('webtype')
  $dbtype = hiera('dbtype')

  $omero_user = hiera('omero_user')
  $omero_group = hiera('omero_group')
  
  $db_version = hiera('db_version')
  $db_patch = hiera('db_patch')
  $root_password = hiera('omero_root_password')
  
}
