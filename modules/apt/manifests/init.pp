# ESC 2012.04.27
# operations for apt
#------------------------------------------------------------------------------- 

class apt {
    exec { "apt-get_update":
        environment => "HOME=/root",
        command     => "/usr/bin/apt-get update",
        user        => "root",
        group       => "root",
        logoutput   => on_failure,
    }
}
