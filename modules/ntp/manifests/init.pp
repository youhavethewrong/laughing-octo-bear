# ESC 2012.04.27
# module for network time protocol daemon
#------------------------------------------------------------------------------- 

class ntp {
    Package["ntp"] ~> Service["ntp"]

    $svc_name = $operatingsystem ? {
        'Debian' => 'ntp',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    $pkg_name = $operatingsystem ? {
        'Debian' => 'ntp',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { "ntp":
        ensure => installed,
        name   => $pkg_name,
    }

    service { "ntp":
        ensure    => running,
        hasstatus => true,
        name      => $svc_name,
    }
}
