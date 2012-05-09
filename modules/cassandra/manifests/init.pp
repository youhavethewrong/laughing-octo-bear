# ESC 2012.04.24
# module for apache cassandra
#------------------------------------------------------------------------------- 

class cassandra ($release = '11x') {

    include apt
    include java

    # $release is the cassandra release noted here:
    # http://wiki.apache.org/cassandra/DebianPackaging

    # manage package before service and notify service
    Package['cassandra'] ~> Service['cassandra']
    File['/etc/cassandra/cassandra.yaml'] ~> Service['cassandra']

    # make sure apache GPG keys are installed
    apt::key { 'apache-cassandra-key': 
        ensure => present, 
        name   => '4BD736A82B5C1B00',
    }

    # make sure cassandra debian repo is installed
    $cass_mirror = $operatingsystem ? {
        'Debian' => "deb http://www.apache.org/dist/cassandra/debian ${release} main",
        'Ubuntu' => "deb http://www.apache.org/dist/cassandra/debian ${release} main",
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }

    # add an apt mirror for cassandra packages
    # if this breaks, check http://wiki.apache.org/cassandra/DebianPackaging
    file { '/etc/apt/sources.list.d/cassandra.list':
        ensure  => present,
        content => $cass_mirror,
        mode    => 444,
        owner   => root,
        group   => root,
        notify  => Exec['apt-get_update'],
    }


    file { '/etc/cassandra/cassandra.yaml':
        ensure => present,
        source => 'puppet:///modules/cassandra/files/cassandra.yaml',
        mode   => 444,
        owner  => root,
        group  => root,
        require => Package['cassandra'],
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
