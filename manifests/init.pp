class jmxtrans {

    package { 'jmxtrans':
        ensure => latest,
    }


    service { 'jmxtrans':
        ensure  => running,
        enable  => true,
        require => Package['jmxtrans'],
    }

    # collect exported resources
    Jmxtrans::Writer::Graphite <<| tag == 'jmxtrans' |>>

}
