#!/usr/bin/env bash
# Automating my Tasks

file { '/etc/ssh/ssh_config':
  ensure => present,
content  => "
    # SSH client configuration
    Host *
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
  ",
}
