class php::service {
    service{ 'httpd':
        enable => true,
        ensure => running,
        hasrestart => true,
    }
}
