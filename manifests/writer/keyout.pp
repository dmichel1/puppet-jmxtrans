define jmxtrans::writer::keyout (
    $hostFQDN,
    $hostPort,
    $outputFile        = hiera('jmxtrans_koOutputFile', '/tmp'),
    $debug             = hiera('jmxtrans_koDebug', false),
    $numQueryThreads   = hiera('jmxtrans_numQueryThreads', 2)
) {

    file { "/var/lib/jmxtrans/${hostFQDN}_${hostPort}.json":
        ensure   => file,
        mode     => '0644',
        owner    => 'jmxtrans',
        group    => 'jmxtrans',
        content  => template('jmxtrans/var/lib/jmxtrans/tomcat-keyout.json.erb'),
        notify   => Service['jmxtrans'],
    }




}
