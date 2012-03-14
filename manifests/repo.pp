#
class omero::repo (
  $repo_dir = hiera('repo_dir'),
  $repo_owner = hiera('repo_owner'),
  $repo_group = hiera('repo_group'),
  $mode = hiera('repo_perms'),
) {
  file { $repo_dir:
    ensure => 'directory',
    owner  => $repo_owner,
    group  => $repo_group,
    mode   => $mode,
  }
}
