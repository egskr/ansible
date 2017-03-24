#!/usr/bin/bash
cat << EOF
{
"Vagrant": $(/usr/bin/vagrant halt)

}
EOF
