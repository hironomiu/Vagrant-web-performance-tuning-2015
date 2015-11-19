class memcached::install{
    package{
        [
        'memcached',
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi'],
    }
}
