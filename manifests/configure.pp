# == Class: digest::configure
#
# Configures digest authentication for apache
class digest::configure {
  $htpasswd = $digest::htpasswd
  $users = $digest::users
  $locations = $digest::locations
  $realm = $digest::realm

  file { '/etc/apache2/htpasswd':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0600',
    content => template('digest/htpasswd.erb'),
  } -> apache::loadmodule{'auth_digest': }

  file { '/etc/apache2/conf-available/digest.conf':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => template('digest/digest.erb'),
  } -> apache::loadconf{'digest': }
}
