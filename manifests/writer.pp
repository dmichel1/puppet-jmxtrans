define jmxtrans::writer (
    $host,
    $port,
    $numQueryThreads = hiera('jmxtrans_numQueryThreads', 2)
) {



    file { "/tmp/test.json":
        ensure   => file,
        mode     => '0644',
        owner    => 'jmxtrans',
        group    => 'jmxtrans',
        content  => template('jmxtrans/var/lib/jmxtrans/writer.json.erb'),
        notify   => Service['jmxtrans'],
    }




}
