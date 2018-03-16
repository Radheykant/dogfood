file {'/tmp/pandorafms_agent_unix.tar.gz':
                owner   => "root",
                group   => "root",
                mode    => '0775',
                ensure  => present,
		source  => "file:///etc/puppetlabs/code/environments/production/files/pandorafms_agent_unix-7.0NG.719.tar.gz",
                notify  => Exec["unpack"]
        }

        exec { "unpack":
                command     => "/bin/tar xf /tmp/pandorafms_agent_unix.tar.gz",
                cwd         => "/tmp/unix",
                refreshonly => true,
                #require     => File[$variable_dir],
                notify      => Exec["install pandora"]
        }

        exec { "install pandora":
                cwd         => "/tmp/unix",
                command     => "/bin/sh pandora_agent_installer --install",
                logoutput   => true,
                refreshonly => true,
        }

        service { 'pandora_agent_daemon':
        ensure => running,
        name => "pandora_agent_daemon",
        enable => true,
        }
