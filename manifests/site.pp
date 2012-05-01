# ESC 2012.04.06
# puppet node specification

node default {
    include python
    include ntp
    include sshd
}

node /^www\d*\.*/ inherits default {
    include nginx
}

node /^proxy\d*\./ inherits default {
    include haproxy
}

node /^dns\d*\./ inherits default {
    include bind
}

node /^db\d*\./ inherits default {
    include cassandra
}

node /^app\d*\./ inherits default {
    include gcc
    include python::python-dev
    include python::django
    include python::pip
}
