# default settings go here
# hiera looks at this class to find values
# should never be directly included
# anything here needs a hiera call to be used
# these settings should be overridden by another hiera backend
# do not edit without knowing what you are doing
# these are references
#
class omero::data {
  # general fs settings
  $omero_owner = 'omero'
  $omero_group = 'omero'

  # directories
  $omero_home = '/opt/omero'
  $ice_home = '/usr/share/Ice-3.3.1'

  # these don't have defaults but are listed for reference
  $omero_home_link = ''
  $omero_data_repo_link = ''
  $postgres_custom_service_name = ''

  # software decisions
  $webtype = 'apache'
  $dbtype = 'postgres'
  $java_version = '1.6.0'
  $java_repo_url = 'file:///tmp/omero-java'
  $zeroc_ice_repo_url = 'http://www.glencoesoftware.com/ice-rpms/6/'
  $apache_config_file = '/etc/httpd/conf.d/omero-web.conf'

  # database settings
  $postgres_version = '9.1'
  $postgres_user = 'postgres'
  $omero_db_user = 'omero'
  $omero_db_pass = 'omero'
  $omero_dbname = 'omero'
  $db_version = 'OMERO4.3'
  $db_patch = '0'
  $root_password = 'omeroroot'

  # data repo settings
  $omero_data_repo_dir = '/OMERO'
  $omero_data_repo_owner = 'omero'
  $omero_data_repo_group = 'omero'
  $omero_data_repo_perms = '0775'

}
