# ESC 2012.05.01
# module for KeepAlived
#------------------------------------------------------------------------------- 

class keepalived {

    Package['keepalived'] ~> Service['keepalived']

    $pkg_name = $operatingsystem ? {
        'Debian' => 'keepalived',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'keepalived':
        ensure => installed,
        name   => $pkg_name,
    }

    service { 'keepalived':
        ensure => running,
    }

}
