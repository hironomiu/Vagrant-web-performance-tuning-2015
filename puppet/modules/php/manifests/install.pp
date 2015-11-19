class php::install{
    package{ 
        [
        'php56',
        'php56-cli',
        'php56-common',
        'php56-devel',
        'php56-pdo',
        'php56-xml',
        'php56-mbstring',
        'php56-mysqlnd',
        'php56-pecl-memcached',
        'php56-pecl-xdebug',
        'php56-opcache',
        'php56-fpm',
        'php56-mcrypt',
        'libmcrypt',
        'siege',
        'httpd',
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi-php56,epel'],
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
