class varnish::config {
    file { "/etc/sysconfig/varnish":
        owner => "root", group => "root",
        content => template('varnish/varnish'),
        notify => Service['varnish'],
    }
    file { "/etc/varnish/default.vcl":
        owner => "root", group => "root",
        content => template('varnish/default.vcl'),
        notify => Service['varnish'],
    }
}
