# ESC 2012.05.17
# module for installing the android sdk

class android {

    include java

    file { '/usr/local/android-sdk_r18-linux.tgz':
        ensure  => present,
        source  => 'puppet:///modules/android/android-sdk_r18-linux.tgz',
        owner   => root,
        group   => root,
        mode    => 644,
        require => Class['java'],
    }

    exec { 'expand-android-sdk_r18':
        command => "/bin/tar xzvf /usr/local/android-sdk_r18-linux.tgz -C /usr/local --no-same-owner --no-same-permissions && chgrp -R negated /usr/local/android-sdk-linux",
        unless  => "/usr/bin/test -d /usr/local/android-sdk-linux",
        require => File['/usr/local/android-sdk_r18-linux.tgz'],
    }

    exec { 'update-android-sdk_r18':
        command => "/usr/local/android-sdk-linux/tools/android update",
        unless  => "/usr/bin/test -d /usr/local/android-sdk-linux/platforms/android-10",
        require => File['/usr/local/android-sdk_r18-linux.tgz'],
    }
 
}
