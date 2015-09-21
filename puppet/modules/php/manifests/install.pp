class php::install{
    yumrepo { 'CentALT':
        descr => 'CentALT',
        baseurl => 'http://centos.alt.ru/repository/centos/6/$basearch/',
        enabled    => 0,
        gpgcheck   => 0,
    }

    package{
        'httpd':
        ensure => installed,
        install_options => ['--enablerepo=CentALT'],
        require => Yumrepo['CentALT'],
    }

    yumrepo { 'php-epel':
        descr => 'epel repo',
        mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'https://fedoraproject.org/static/0608B895.txt',
        require => Package['httpd'],
    }

    yumrepo { 'php-remi':
        descr => 'remi repo',
        mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/mirror',
        enabled        => 0,
        gpgcheck       => 1,
        gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
        priority       => 1,
        require => Yumrepo['php-epel'],
    }

    package{ 
        [
        'php',
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
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=php-epel,php-remi'],
        require => Yumrepo['php-remi']
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
        require => Yumrepo['php-remi']
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Yumrepo['php-remi'],
    }

}
