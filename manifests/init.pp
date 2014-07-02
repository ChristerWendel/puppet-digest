# == Class: digest
#
# A module to configure digest authentication for apache
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["htpasswd"]
#   Location of htpasswd file
#
# ["realm"]
#   The realm to use
#
# ["users"]
#   Contents of htpasswd file
#
# ["locations"]
#   Directories that will require authentication
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class digest (
  $version = 'present',
  $htpasswd = '/etc/apache2/htpasswd',
  $realm = 'Apache Digest',
  $users = [],
  $locations = [],
  $enable = true,
  $start = true
  )  {
    include apache

    class{'digest::configure': } ~>
    Service['apache2'] ->
    Class['digest']
  }
