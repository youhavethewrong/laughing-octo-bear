# ESC 2012.05.17
# module for negated's stuff

class negated {

    file { '/home/negated/.bashrc':
        ensure => present,
        source => 'puppet:///modules/negated/bashrc',
        mode   => 644,
        owner  => negated,
        group  => negated,
    }
}
