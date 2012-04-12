# ESC 2012.04.06
# puppet node specification

node default {
    include sshd
}

node /^www\d*\.*/ inherits default {
    include nginx
}

node /^proxy\d*\./ inherits default {
    include lighttpd
}

node /^dns\d*\./ inherits default {
    include bind
}

node /^db\d*\./ inherits default {
    include mysql
}

node /^app\d*\./ inherits default {
    include python
}
