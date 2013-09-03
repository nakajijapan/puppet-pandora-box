class rbenv::setup {
  $rbenv_path = ['/usr/local/rbenv/shims', '/usr/local/rbenv/bin', '/usr/local/bin', '/bin', '/usr/bin']

  exec {
    'rbenv::setup gem:bundle':
      command => 'gem install bundle',
      path    => $rbenv_path,
      unless  => 'gem list | grep bundle',
   }

  exec {
    'rbenv::setup gem:rake':
      command => 'gem install rake',
      path    => $rbenv_path,
      unless  => 'gem list | grep rake',
  }

}
