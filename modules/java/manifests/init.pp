# ESC 2012.04.24
# module for sun java
#------------------------------------------------------------------------------- 

class java {

    # need the apt class so we can update apt's sources
    include apt

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
        notify  => Exec['apt-get_update'],
    }

    # ensure latest sun-java6-jdk
    package { 'sun-java6-jdk':
        ensure    => latest,
        subscribe => File['/etc/apt/sources.list.d/non-free.list'],
    } 

    # auto-accept the weird oracle license
    exec { 'sun-java6-jdk-license-accept':
        command => "/bin/echo 'sun-java6-jdk shared/accepted-sun-dlj-v1-1 boolean true'|/usr/bin/debconf-set-selections",
        unless  => "/usr/bin/debconf-get-selections |grep sun-java6-jdk|grep accepted-sun-dlj",
        before  => Package['sun-java6-jdk'],
    }
}
