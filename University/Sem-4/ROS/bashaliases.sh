#!/bin/bash

function addbashaliases() {
  # Add source bash_aliases on .bashrc
  cat >> ~/.bashrc << EOT

# Autostart /ros_entrypoint.sh
if [ -f /ros_entrypoint.sh ]; then
    source /ros_entrypoint.sh
else
    echo "File Not Found: /ros_entrypoint.sh"
fi
EOT

  source ~/.bashrc
}

addbashaliases
