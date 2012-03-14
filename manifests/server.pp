class omero::server inherits omero {
  class {
    'omero::packages':
      ;
    'omero::database':
      ;
    'omero::web':
      ;
    'omero::repo':
      ;
  }
}
