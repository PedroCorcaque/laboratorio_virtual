#!/bin/sh
command_exists() {
    command -v "$@" >/dev/null 2>&1
}

user_can_sudo() {
    command_exists sudo || return 1
    ! LANG= sudo -n -v 2>&1 | grep -q "may not run sudo"
}

command_exists git || {
    printf "git is not installed"
    return 1
}

command_exists pip3 || {
    printf "pip3 is not installed"
    return 1
}

command_exists nodejs || {
    printf "nodejs is not installed"
    return 1
}

command_exists npm || {
    printf "npm is not installed"
    return 1
}

# Create main directory
mkdir ~/laboratorio_virtual

# Clone the backend repository
cd ~/laboratorio_virtual
git clone https://github.com/PedroCorcaque/labvirtual-backend.git

# Setup the backend
cd ~/laboratorio_virtual/labvirtual-backend
pip3 install -r requirements.txt

# Clone the frontend repository
cd ~/laboratorio_virtual
git clone https://github.com/PedroCorcaque/labvirtual-interface.git

# Setup the frontend
cd ~/laboratorio_virtual/labvirtual-interface
npm install

# Clone the LabVirtual-AgroIOT repository
cd ~/laboratorio_virtual
git clone https://github.com/PedroCorcaque/LabVirtual-AgroIOT.git

# Setup the LabVirtual-AgroIOT
cd ~/laboratorio_virtual/LabVirtual-AgroIOT
pip3 install -r requirements.txt
