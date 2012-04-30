# ESC 2012.04.30
# module for python-pip, 

class python::pip {

    $pkg_name = $operatingsystem ? {
        'Debian' => 'python-pip',
        'Ubuntu' => 'python-pip',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'python::pip':
        ensure => latest,
        name   => $pkg_name,
    }
}
