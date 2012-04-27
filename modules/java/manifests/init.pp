# ESC 2012.04.24
# module for sun java
#------------------------------------------------------------------------------- 

class java {

    # manage the file before the package and notify the package
    File['/etc/apt/sources.list.d/non-free.list'] ~> Package['sun-java6-jdk']

    # determine the right mirror to add for the OS
    $nf_mirror = $operatingsystem ? {
        'Debian' => "deb http://ftp.uwsg.indiana.edu/linux/debian/ ${lsbdistcodename} non-free",
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    # add an apt mirror for sun-java6-jdk
    file { '/etc/apt/sources.list.d/non-free.list':
        ensure  => present,
        content => $nf_mirror,
        mode    => 444,
        owner   => root,
        group   => root,
        require => Class["apt-get::update"],
    }

    # ensure latest sun-java6-jdk
    package { 'sun-java6-jdk':
        ensure  => latest,
    } 
}
