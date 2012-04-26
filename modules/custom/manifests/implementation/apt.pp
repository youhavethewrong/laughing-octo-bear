# ESC 2012.04.26
# operations for apt
#------------------------------------------------------------------------------- 

class apt-get {
    
}

class apt-get::update {
    exec { "/usr/bin/apt-get update":}
}
