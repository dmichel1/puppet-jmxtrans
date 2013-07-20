# Install the latest version of openjdk

class jmxtrans::java_openjdk {

    package { 'java-1.7.0-openjdk.x86_64':
        ensure => latest,
    }

    package { 'java-1.7.0-openjdk-devel.x86_64':
        ensure => latest,
    }


}
