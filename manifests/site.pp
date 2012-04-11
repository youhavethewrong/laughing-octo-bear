# ESC 2012.04.06
# puppet node specification

node default {
    include sshd
}

node /^www\d*\.*/ inherits default {
    Package['apache::apache'] { ensure => absent }
    include nginx
}

node /^proxy\d*\./ inherits default {
    include lighttpd
}
