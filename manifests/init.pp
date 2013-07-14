class jmxtrans {

    package { 'jmxtrans':
        ensure => latest,
    }


    service { 'jmxtrans':
        ensure => running,
        enable => true,
    }

 jmxtrans::writer { 'test':
     host => 'localhost',
         port => 2101,
           }

}
