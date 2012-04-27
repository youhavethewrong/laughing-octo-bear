# ESC 2012.04.27
# operations for apt
#------------------------------------------------------------------------------- 

class apt {

}

class apt::apt-get inherits apt {
    
}

class apt::apt-get::update inherits apt::apt-get {
    exec { "/usr/bin/apt-get update":}
}
