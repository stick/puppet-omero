#
class omero::web {
  package {
    'matplotlib':
      name => 'python-matplotlib',
      ;
  }

  class { "omero::web::${omero::settings::webtype}": }
}
