# settings class
# variables only, use hiera to allow custom override
class omero::settings {
  $dbtype = hiera('dbtype', 'postgres')
  $webtype = hiera('webtype', 'apache')
}
