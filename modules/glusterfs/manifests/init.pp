# ESC 2012.05.11
# module for GlusterFS
#------------------------------------------------------------------------------- 

class glusterfs {
    
    package { 'glusterfs-common':
        ensure => '3.2.4-1~bpo60+1',
    }

    package { 'glusterfs-client':
        ensure  => '3.2.4-1~bpo60+1',
        require => Package['glusterfs-common'],
    }

    package { 'glusterfs-server':
        ensure   => '3.2.4-1~bpo60+1',
        require  => Package['glusterfs-common', 'glusterfs-client'],
    }

}
