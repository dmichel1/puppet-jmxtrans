define jmxtrans::writer::keyout (
    $hostPort,
    $hostFQDN          = $name,
    $outputFile        = hiera('jmxtrans::keyoutOutputFile', '/var/log/jmxtrans/keyout'),
    $debug             = hiera('jmxtrans::keyoutDebug', false),
    $numQueryThreads   = hiera('jmxtrans::numQueryThreads', 2)
) {

    # realize the virtual resource only once
    File <| title == '/var/log/jmxtrans/keyout' |>

    file { "/var/lib/jmxtrans/${hostFQDN}_${hostPort}.json":
        ensure   => file,
        mode     => '0644',
        owner    => 'jmxtrans',
        group    => 'jmxtrans',
        content  => template('jmxtrans/var/lib/jmxtrans/tomcat-keyout.json.erb'),
        notify   => Service['jmxtrans'],
        tag      => 'jmxtrans-keyout',
    }




}
