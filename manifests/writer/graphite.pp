define jmxtrans::writer::graphite (
    $graphiteServer,
    $graphitePort,
    $host_port,
    $host_fqdn       = $name,
    $numQueryThreads = hiera('jmxtrans_numQueryThreads', 2)
) {

    file { "/tmp/test.json":
        ensure   => file,
        mode     => '0644',
        owner    => 'jmxtrans',
        group    => 'jmxtrans',
        content  => template('jmxtrans/var/lib/jmxtrans/tomcat-graphite.json.erb'),
        notify   => Service['jmxtrans'],
        tag      => 'jmxtrans',
    }




}
