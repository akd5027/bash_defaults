#!/bin/bash

function installThings {
    if command -v apt > /dev/null; then
        let InstallCmd='apt'
    elif command -v dnf > /dev/null; then
        let InstallCmd='dnf'
    elif command -v yum > /dev/null; then
        let InstallCmd='yum'
    else
        exit 1
    fi

    echo "Installing $*"
    sudo $InstallCmd $*
}

git submodule update --init || true

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command failed with exit code $?."' EXIT


echo 'Installing content'
installThings bison flex libevent-devel libncurses-dev automake autoconf pkg-config

set -e

echo 'Copying over files...'
cp .vimrc .tmux.conf .pureline.conf ~
cp -r .vim pureline ~

vim +"PluginUpdate" +xa

cd powerline
    ./install.sh
cd ..

# Currently bash-specific
if ! grep -q 'source .*pureline' ~/.bashrc; then
    cat << EOF >> ~/.bashrc

if [ "$TERM" != "linux" ]; then
    source ~/pureline/pureline ~/.pureline.conf
fi
EOF
fi

# Update cmake to latest
cd cmake
    mkdir -p _build
    cd _build
        cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
        cmake --build . --config Release -j`nproc`
        sudo make install
    cd ..
cd ..

cd tmux
    ./autogen.sh
    ./configure
    make -j`nproc`
    sudo make install DESTDIR='/usr'
cd ..

make -C clang_complete install
