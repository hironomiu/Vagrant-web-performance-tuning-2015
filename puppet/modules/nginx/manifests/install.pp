class nginx::install{
    package{
        'nginx':
        ensure => installed,
        install_options => ['--enablerepo=remi'],
    }
}
