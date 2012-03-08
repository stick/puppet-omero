class omero::server inherits omero::settings {
  class { "omero::database::${omero::settings::dbtype}": }
  class { "omero::web::${omero::settings::webtype}": }
}
