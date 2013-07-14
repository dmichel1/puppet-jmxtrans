class jmxtrans::java {



    package { 'java-1.7.0-openjdk.x86_64':
        esnure => latest,
    }



    package { 'java-1.7.0-openjdk-devel.x86_64':
        ensure => latest,
    }


}
