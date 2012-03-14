#
class omero::web (
  $webtype = hiera('webtype')
) {
  package {
    'matplotlib':
      name => 'python-matplotlib',
      ;
  }

  class { "omero::web::${webtype}": }
}
