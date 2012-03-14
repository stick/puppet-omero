#
class omero::repo (
  $repo_dir = hiera('repo_dir', '/OMERO'),
  $repo_owner = hiera('repo_owner', 'omero'),
  $repo_group = hiera('repo_group', 'omero'),
  $mode = '0775'
) {
  file { $repo_dir:
    ensure => 'directory',
    owner  => $repo_owner,
    group  => $repo_group,
    mode   => $mode,
  }
}
