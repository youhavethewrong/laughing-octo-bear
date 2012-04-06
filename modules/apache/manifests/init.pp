# ESC 2012.04.06
# apache module

class apache {

    # service depends on package and is notified when it changes
    Package['apache'] ~> Service['apache']

    $pkg_name = $operatingsystem ? {
        'Debian' => 'apache2',
        'Ubuntu' => 'apache2',
        'RedHat' => 'httpd',
        'CentOS' => 'httpd',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'apache':
        ensure => latest,
        name   => $pkg_name,
    }

    service { 'apache':
        ensure    => running,
        hasstatus => true,
    }

}
