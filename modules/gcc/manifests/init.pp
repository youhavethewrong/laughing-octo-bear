# ESC 2012.04.30
# module for gnu compiler collection

class gcc {

    $pkg_name = $operatingsystem ? {
        'Debian' => 'gcc', 
        'Ubuntu' => 'gcc', 
        default  => fail("OS ${operatingsystem} not supported by ${module_name} module."),
    }
    
    package { "gcc":
        ensure => installed,
        name   => $pkg_name,
    }

}
