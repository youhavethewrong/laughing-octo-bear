# ESC 2012.04.09
# NGINX module
#------------------------------------------------------------------------------- 

class nginx {

    # service depends on package and is notified when it changes
    Package['nginx'] ~> Service['nginx']

    # for some hosts, we want to use a slimmer version of nginx
    if $memorysize_kb < 1024*1024 {
        $which_pkg = 'nginx-light'
    } else {
        $which_pkg = 'nginx-full'
    }

    # choose the version of nginx to install based on memory size
    $pkg_name = $operatingsystem ? {
        'Debian' => $which_pkg,
        'Ubuntu' => $which_pkg,
        'RedHat' => 'nginx',
        'CentOS' => 'nginx',
        default  => 
          fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    package { 'nginx':
        ensure => latest,
        name   => $pkg_name,
    }

    service { 'nginx':
        ensure    => running,
        hasstatus => true,
    }

}
