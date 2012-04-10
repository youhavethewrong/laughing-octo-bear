# ESC 2012.04.06
# puppet node specification

node default {
    include common
    include sshd
}

node /^www\d*\.*/ inherits default {
    include apache
}

node /^proxy\d*\./ inherits default {
    include lighttpd
}
