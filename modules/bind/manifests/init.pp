# ESC 2012.04.11
# module for bind
#------------------------------------------------------------------------------- 

class bind {

   Package['bind'] ~> Service['bind']

    $pkg_name = $operatingsystem ? {
        'Debian' => 'bind9',
        'Ubuntu' => 'bind9',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    } 

    package { 'bind':
        ensure => latest,
        name   => $pkg_name,
    }

    service { 'bind':
        ensure    => running,
        name      => $pkg_name,
        hasstatus => true,
    }

}
