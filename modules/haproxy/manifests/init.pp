# ESC 2012.05.01
# module for HAproxy
#------------------------------------------------------------------------------- 

class haproxy {

    Package['haproxy'] ~> Service['haproxy']
    
    $pkg_name = $operatingsystem ? {
        'Debian' => 'haproxy',
        'Ubuntu' => 'haproxy',
        'Fedora' => 'haproxy',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'haproxy':
        ensure => latest,
        name   => $pkg_name,
    }

    service { 'haproxy':
        ensure => running,
    }

}
