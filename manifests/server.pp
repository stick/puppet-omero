class omero::server inherits omero::settings {
  class {
    'omero::packages':
      ;
    'omero::database':
      ;
    'omero::web':
      ;
  }
}
