# ESC 2012.04.11
# module for python-pylons, a web framework

class python::pylons {

    $pkg_name = $operatingsystem ? {
        'Debian' => 'python-pylons',
        'Ubuntu' => 'python-pylons',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'python::pylons':
        ensure => installed,
        name   => $pkg_name,
    }
}
