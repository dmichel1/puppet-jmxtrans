puppet-jmxtrans - Under Development
===============
A Puppet module used to install, configure and manage JMXTrans.

JMXTrans can be used to make queries against a JVM using JMX and push this data to a number of different backends called writers.

Some of the writers are:
  - Graphite
  - Statsd
  - Ganglia
  - Keyout (file tab delimited)


Important
---------
This module assumes you have the rpm installed locally (see the download link below) or in your repo.


How to Use - Store Configs
----------
This module uses storeconfigs to export app servers to query and collect via jmxtrans.


In your site.pp or ENC add...

To install and configure JMXTrans
```puppet
node 'jmxtrans' {
    include jmxtrans
    #include jmxtrans::java_openjdk # optionally install java
}
```


To add an app server

```puppet
node 'app01' {
    @@jmxtrans::writer::graphite { $::fqdn:
        host_port      => 2101,
        graphiteServer => 'graphite.drewl.org',
        graphitePort   => 2003,
    }
}
```




Download Page
-------------
You can find rpm's, deb's and a universal zip using the link below.


https://github.com/jmxtrans/jmxtrans/downloads

Examples
-------------
More examples can be found on the jmxtrans wiki page.

https://github.com/jmxtrans/jmxtrans/wiki/MoreExamples


