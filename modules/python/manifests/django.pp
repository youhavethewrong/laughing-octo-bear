# ESC 2012.04.19
# module for python-django, YAPWF

class python::django {

    $pkg_name = $operatingsystem ? {
        'Debian' => 'python-django',
        'Ubuntu' => 'python-django',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'python::django':
        ensure => latest,
        name   => $pkg_name,
    }
}
