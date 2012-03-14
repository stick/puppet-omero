#
class omero::web {
  package {
    'matplotlib':
      name => 'python-matplotlib',
      ;
  }

  $webtype = hiera('webtype')
  class { "omero::web::${webtype}": }
}
