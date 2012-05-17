# ESC 2012.05.16
# module for maven build thingy

class maven {

    include java

    $pkg_name = $operatingsystem ? {
        'Debian' => 'maven2',
        'Ubuntu' => 'maven2',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'maven' :
        ensure  => latest,
        name    => $pkg_name,
        require => Class['java'],
    }

}
