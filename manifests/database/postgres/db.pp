define omero::database::postgres::db (
  $owner,
  $dbname = $name,
  $ensure = 'present',
  $pg_user,
  $template_db = 'template1',
  $version
) {

  $pg_dir = "/usr/pgsql-${version}"
  $dbexists = 'commandtoseeifdbexists'

  omero::database::postgres::owner { $owner:
    ensure  => $ensure,
    version => $version,
    pg_user => $pg_user,
  }

  if $ensure == 'present' {

    exec { "createdb $name":
      command => "createdb -T ${template_db} -O ${owner} ${dbname}",
      path    => [ '/usr/bin', "${pg_dir}/bin" ],
      user    => $pg_user,
      unless  => $dbexists,
      require => Omero::Database::Postgres::User[$owner],
    }


  } elsif $ensure == 'absent' {

    exec { "dropdb $name":
      command => "dropdb $name",
      user => $pg_user,
      onlyif => $dbexists,
      before => Omero::Database::Postgres::User[$owner],
    }
  }
}
