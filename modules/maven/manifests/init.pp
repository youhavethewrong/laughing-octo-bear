# ESC 2012.05.16
# module for maven build thingy

class maven {

    include java

    file { '/usr/local/apache-maven':
        ensure => directory,
        mode   => 755,
        owner  => root,
        group  => root,
    }

    file { '/usr/local/apache-maven/apache-maven-3.0.4-bin.tar.gz':
        ensure => present,
        source => 'puppet:///modules/maven/apache-maven-3.0.4-bin.tar.gz',
        mode   => 644,
        owner  => root,
        group  => root,
        require => [File['/usr/local/apache-maven'],Class['java']],
    }

    exec { 'expand-apache-maven-3.0.4':
        command => "/bin/tar xzvf /usr/local/apache-maven/apache-maven-3.0.4-bin.tar.gz -C /usr/local/apache-maven",
        unless  => "/usr/bin/test -d /usr/local/apache-maven/apache-maven-3.0.4",
        require => File['/usr/local/apache-maven/apache-maven-3.0.4-bin.tar.gz'],
    }

}
