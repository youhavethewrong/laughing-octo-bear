# ESC 2012.04.24
# module for apache cassandra
#------------------------------------------------------------------------------- 

class cassandra ($release = '11x') {

    include apt
    include java

    # $release is the cassandra release noted here:
    # http://wiki.apache.org/cassandra/DebianPackaging

    # file before package before service and notify down the chain
    File['/etc/apt/sources.list.d/cassandra.list'] ~> Package['cassandra'] ~> Service['cassandra']

    # make sure apache GPG keys are installed

    # make sure cassandra debian repo is installed
    $cass_mirror = $operatingsystem ? {
        'Debian' => "deb http://www.apache.org/dist/cassandra/debian ${release} main",
        'Ubuntu' => "deb http://www.apache.org/dist/cassandra/debian ${release} main",
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    # add an apt mirror for cassandra packages
    # if this breaks, check http://wiki.apache.org/cassandra/DebianPackaging
    file { '/etc/apt/sources.list.d/cassandra.list':
        ensure => present,
        content => $cass_mirror,
        mode    => 444,
        owner   => root,
        group   => root,
        require => Exec['apt-get_update'],
    }

    # ensure latest cassandra is installed
    package { 'cassandra':
        ensure  => latest,
        require => Class['java'],
    }

    # ensure cassandra is running
    service { 'cassandra':
        ensure => running,
    }
}
