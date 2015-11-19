class php::install{
    exec { "nodejs npm" :
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y install nodejs npm --disablerepo=scl',
        timeout => 999,
    }

    exec{ 
        'php56':
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y install php56 --enablerepo=remi-php56',
        timeout => 999,
        require => Exec['nodejs npm'],
    }

    exec{ 
        'php56-2':
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y --disablerepo=base,updates install php-cli php-common php-devel php-pdo php-xml php-mbstring php-pecl-xdebug php-fpm --enablerepo=remi-php56',
        timeout => 999,
        require => Exec['php56'],
    }

    exec{ 
        'php56-3':
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y --disablerepo=base,updates,epel,varnish-epel install php-mcrypt --enablerepo=remi-php56',
        timeout => 999,
        require => Exec['php56-2'],
    }

    exec{ 
        'php56-4':
        user => 'root',
        cwd => '/root',
        path => ['/usr/bin','/bin'],
        command => 'yum -y install php-pecl-igbinary php-pecl-memcached --enablerepo=remi-php56',
        timeout => 999,
        require => Exec['php56-3'],
    }

    package{ 
        [
        'siege',
        'httpd',
        ]:
        provider => 'yum',
        ensure => installed,
        install_options => ['--enablerepo=remi-php56,epel'],
        require => Exec['php56-4'],
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
        require => Exec['php56-4'],
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Exec['php56-4'],
    }

}
