class php::config {
    file { '/etc/php.ini':
        owner => 'root', group => 'root',
        content => template('php/php.ini'),
    }
    file { '/etc/php.d/10-opcache.ini':
        owner => 'root', group => 'root',
        content => template('php/10-opcache.ini'),
    }
}
