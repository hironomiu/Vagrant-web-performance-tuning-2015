class php::install{
    exec { "nodejs npm" :
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y install nodejs npm --disablerepo=scl',
        timeout => 999,
    }

    package{ 
        'php56':
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi-php56'],
        require => Exec['nodejs npm'],
    }

    package{ 
        [
        'php-cli',
        'php-common',
        'php-devel',
        'php-pdo',
        'php-xml',
        'php-mbstring',
        'php-pecl-memcached',
        'php-pecl-xdebug',
        'php-fpm',
        'php-mcrypt',
        'libmcrypt',
        'siege',
        'httpd',
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi-php56,epel'],
        require => Package['php56'],
    }

    package{
        [
        'openssh-clients',
        'wget',
        'git',
        'screen',
        'unzip',
        'make',
        'dstat',
        'emacs',
        'telnet',
        'tree',
        'sysstat',
        'perf',
        'cronie-noanacron',
        ]:
        provider => 'yum',
        ensure => installed,
        require => Package['php56'],
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Package['php56'],
    }

}
