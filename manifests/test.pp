file {'/tmp/hello.txt' :
ensure => file,
content => "hello world\n",
}

package {'tmux': 
ensure => installed,
}        

package {'htop': 
ensure => installed,
}

package {'telnet': 
ensure => absent,
}

package {'ruby': 
ensure => latest,
}

package {'puppet-lint': 
ensure => installed,
provider => gem,
}
