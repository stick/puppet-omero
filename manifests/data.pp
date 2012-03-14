# default settings go here
# hiera looks at this class to find values
# should never be directly included
# anything here needs a hiera call to be used
# usually done in omero::settings
#
class omero::data {
  # general fs settings
  $omero_owner = 'omero'
  $omero_group = 'omero'

  # directories
  $omero_home = '/opt/omero'
  $ice_home = '/usr/share/Ice-3.3.1'

  # software decisions
  $webtype = 'apache'
  $dbtype = 'postgres'
  $java_version = '1.6.0'
  $java_repo_url = 'file:///tmp/java-rpms'
  $zeroc_ice_repo_url = 'http://www.glencoesoftware.com/ice-rpms/6/'

  # database settings
  $postgres_version = '9.1'
  $postgres_user = 'postgres'
  $omero_db_user = 'omero'
  $omero_dbname = 'omero'
  $postgres_custom_service_name = ''
  $db_version = 'OMERO4.3'
  $db_patch = '0'
  $root_password = ''

  # data repo settings
  $repo_dir = '/OMERO'
  $repo_owner = 'omero'
  $repo_group = 'omero'
  $repo_perms = '0775'



}
