# ESC 2012.04.06
# puppet node specification

node default {
    include python
    include ntp
    include sshd
}

node /^app\d+.*/ inherits default {
    include gcc
    include python::python-dev
    include python::django
    include python::pip
}

node /^build\d+.*/ inherits default {
    include maven
}

node /^db\d+.*/ inherits default {
    include cassandra
}

node /^dns\d+.*/ inherits default {
    include bind
}

node /^proxy\d+.*/ inherits default {
    include haproxy
    include keepalived
}

node /^storage\d+.*/ inherits default {
    include glusterfs
}

node /^www\d+.*/ inherits default {
    include nginx
}
