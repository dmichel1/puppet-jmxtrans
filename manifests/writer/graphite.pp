define jmxtrans::writer::graphite (
    $graphiteServer,
    $graphitePort,
    $hostPort,
    $hostFQDN        = $name,
    $numQueryThreads = hiera('jmxtrans::numQueryThreads', 2)
) {

    file { "/var/lib/jmxtrans/${hostFQDN}_${hostPort}.json":
        ensure   => file,
        mode     => '0644',
        owner    => 'jmxtrans',
        group    => 'jmxtrans',
        content  => template('jmxtrans/var/lib/jmxtrans/tomcat-graphite.json.erb'),
        notify   => Service['jmxtrans'],
        tag      => 'jmxtrans-graphite',
    }




}
