class php::install{
    package{ 
        'php56':
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi-php56'],
    }
    package{ 
        [
        'php-cli',
        'php-common',
        'php-devel',
        'php-pdo',
        'php-xml',
        'php-mbstring',
        'php-mysqlnd',
        'php-pecl-memcached',
        'php-pecl-xdebug',
        'php-opcache',
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
        'npm',
        ]:
        provider => 'yum',
        ensure => installed,
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
    }

}
