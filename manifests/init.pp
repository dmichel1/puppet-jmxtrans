class jmxtrans {

    package { 'jmxtrans':
        ensure => latest,
    }


    service { 'jmxtrans':
        ensure  => running,
        enable  => true,
        require => Package['jmxtrans'],
    }

    # create a virtual resource, that way the directory
    # only gets created if you use the keyout writer
    @file { '/var/log/jmxtrans/keyout':
        ensure => directory,
        mode   => '0755',
        owner  => 'jmxtrans',
        group  => 'jmxtrans',
    }


    # collect exported resources for the graphite writer
    Jmxtrans::Writer::Graphite <<| tag == 'jmxtrans-graphite' |>>

    # collect exported resources fot the keyout writer
    Jmxtrans::Writer::Keyout <<| tag == 'jmxtrans-keyout' |>>

}
