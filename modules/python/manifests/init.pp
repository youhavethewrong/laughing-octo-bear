# ESC 2012.04.11
# module for python and related python modules

class python {
    package { 'python':
        ensure => installed,
    }
}

class python::python-dev inherits python {
    package { 'python-dev':
        ensure => installed,
    }
}
