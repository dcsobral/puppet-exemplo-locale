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

file { '/etc/locale.gen':
	ensure  => present,
	source  => '/root/exemplo/locale.gen',
	require => Package['locales'],
	owner   => 'root',
	group   => 'root',
	mode    => 644,
}

exec { '/usr/sbin/locale-gen':
    subscribe   => File['/etc/locale.gen'],
    refreshonly => true,
    require     => [ Package['locales'], File['/etc/locale.gen'] ],
}

