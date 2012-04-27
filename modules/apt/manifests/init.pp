# ESC 2012.04.27
# operations for apt
#------------------------------------------------------------------------------- 

class apt {

  exec { "apt-get_update":
    command => "/usr/bin/apt-get update",
  }
}
