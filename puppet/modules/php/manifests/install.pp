class php::install{
    include mysql::install
    Class['mysql::install'] -> Class['php::install']

    yumrepo { 'php-remi':
        descr => 'remi repo',
          mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/php56/mirror',
          enabled        => 1,
          gpgcheck       => 1,
          gpgkey     => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi',
          priority       => 1,
    }

    package{ 'php':
        provider => 'yum',
        ensure => installed,
        require => Yumrepo['php-remi'],
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
        'php-opcache',
        'openssh-clients',
        'wget',
        'git',
        'screen',
        'unzip',
        'make',
        'dstat',
        'emacs',
        'tree',
        'sysstat',
        'perf',
        'siege',
        'cronie-noanacron',
        ]:
        provider => 'yum',
        ensure => installed,
        require => Package['php'],
    }

    package{
        [
        'cronie-anacron',
        ]:
        ensure => purged,
        require => Yumrepo['php-remi'],
    }

    yumrepo { 'php-epel':
        descr => 'epel repo',
        mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
        enabled    => 1,
        gpgcheck   => 1,
        gpgkey     => 'https://fedoraproject.org/static/0608B895.txt',
        require => Package['php'],
    }

   package{
        'libmcrypt':
        provider => 'yum',
        ensure => installed,
        require => Yumrepo['php-epel'],
    }

   package{
        'npm':
        provider => 'yum',
        ensure => installed,
        require => Package['libmcrypt'],
    }

   package{
        'php-mcrypt':
        provider => 'yum',
        ensure => installed,
        require => Package['npm'],
    }

}
