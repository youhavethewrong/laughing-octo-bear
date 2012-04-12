# ESC 2012.04.11
# module for python-pyramid, a web framework

class python::pyramid {

    $pkg_name = $operatingsystem ? {
        'Debian' => 'python-pyramid', 
        'Ubuntu' => 'python-pyramid',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'python::pyramid':
        ensure => installed,
        name   => $pkg_name,
    }

}
