class nginx::install{
    package{
        'nginx':
        ensure => installed,
        require => Yumrepo['nginx'],
    }
}
