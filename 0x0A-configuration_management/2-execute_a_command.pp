#Kill a process using exec

exec {'kill-killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin'
}
