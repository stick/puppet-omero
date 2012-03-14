class omero::server (
  $omero_owner = $omero::settings::omero_owner,
  $omero_group = $omero::settings::omero_group,
  $omero_home = $omero::settings::omero_home,
  $omero_home_link = $omero::settings::omero_home_link,
  $omero_db_user = $omero::settings::db_user,
) inherits omero {

  class {
    'omero::packages':
      ;
    'omero::settingsbase':
      ;
    'omero::web':
      ;
    'omero::repo':
      ;
  }

  # create omero_home as a link to a target if defined otherwise a directory
  file { 'omero-home':
    path   => $omero_home,
    ensure => $omero_home_link ? { '' => 'directory', default => 'link' },
    target => $omero_home_link ? { '' => 'notlink', default   => $omero_home_link },
    owner  => $omero_owner,
    group  => $omero_group,
  }

  if $omero_db_user != 'omero' {
    omero::config { 'omero.db.user':
      omero_user => $omero_owner,
      omero_home => $omero_home,
      mode       => 'set',
      value      => $omero_db_user,
    }
  }

  $omero_bin = "${omero_home}/bin"

  if $omero::settings::dbtype == 'postgres' {
    $postgres_bin = "${omero::database::postgres::version}/bin"
    $db_version = $omero::settings::db_version
    $db_patch = $omero::settings::db_patch
    $omero_root_pw = $omero::settings::root_password
    $omero_dbname = $omoer::settings::dbname

    exec { 'create-schema':
      command => "omero db script ${db_version} ${db_patch} ${omero_root_pw} --file - | psql ${omero_dbname} && touch ${omero_home}/.db.by_puppet",
      user    => $omoer_owner,
      path    => [ '/bin', '/usr/bin', "${postgres_bin}", "${omero_bin}" ],
      creates => "${omero_home}/.db.by.puppet",
    }
  }

}
