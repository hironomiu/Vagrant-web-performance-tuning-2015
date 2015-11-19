class php::config {
    file { '/etc/php.ini':
        owner => 'root', group => 'root',
        content => template('php/php.ini'),
    }
    file { '/etc/php.d/opcache.ini':
        owner => 'root', group => 'root',
        content => template('php/opcache.ini'),
    }
    file { '/etc/httpd/conf/httpd.conf':
        owner => 'root', group => 'root',
        content => template('php/httpd.conf'),
    }
}
