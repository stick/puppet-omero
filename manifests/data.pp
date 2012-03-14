# Class: omero::data
#
# This class does stuff that you describe here
#
# Parameters:
#   $parameter:
#       this global variable is used to do things
#
# Actions:
#   Actions should be described here
#
# Requires:
#   - Package["foopackage"]
#
# Sample Usage:
#
class omero::data {
  $omero_home = '/opt/omero'
  $ice_home = '/usr/share/Ice-3.3.1'
  $webtype = 'apache'
  $dbtype = 'postgres'
}
