#!/bin/bash

function init(){
    do_update;
    install_add_apt_repository_command;
    do_dist_upgrade;
    install_git;
    install_python_pip;
    install_python_serial;
    installed_needed_python_packages;
    delete_this_script;
}

function do_update(){
    sudo apt-get update;
}

function install_add_apt_repository_command(){
    sudo apt-get install -y software-properties-common python-software-properties;
}

function do_dist_upgrade(){
    DEBIAN_FRONTEND=noninteractive sudo apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade;    
}

function install_git(){
    sudo apt-add-repository ppa:git-core/ppa;
    sudo apt-get update;
    sudo apt-get -y install git;
}

function install_python_pip(){
    sudo apt-get -y install python-pip;
}

function install_python_serial(){
    sudo apt-get -y install python-serial;
}

function installed_needed_python_packages(){
    sudo pip install requests;
    sudo pip install pathlib;
    sudo pip install pyserial;
}

function delete_this_script(){
    cd ~;
    local script_name;
    script_name=`basename "$0"`
    rm -rf ./$script_name;
}

init
