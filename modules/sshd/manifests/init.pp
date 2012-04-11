# ESC 2012.04.07
# sshd class

class sshd {

    Package['sshd'] ~> Service['sshd']

    $pkg_name = $operatingsystem ? {
        'Debian' => 'openssh-server',
        'Ubuntu' => 'openssh-server',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    $svc_name = $operatingsystem ? {
        'Debian' => 'ssh',
        'Ubuntu' => 'ssh',
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }


    package { 'sshd':
        ensure => latest,
        name   => $pkg_name,
    }

    service { 'sshd':
        ensure    => running,
        name      => $svc_name,
        hasstatus => true,
    }
}
