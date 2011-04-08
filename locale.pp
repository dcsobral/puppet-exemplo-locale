package { 'locales':
	ensure => installed,
}

file { '/etc/default/locale':
	ensure  => present,
	content => 'LANG=pt_BR.UTF-8',
	require => Package['locales'],
	owner   => 'root',
	group   => 'root',
	mode    => 644,
}
