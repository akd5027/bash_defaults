#!/bin/sh
cp -r . ~
rm ~/setup.sh

vim +"PluginUpdate" +xa

cd powerline
./install.sh
cd -


# Currently bash-specific
if ! grep -q 'source .*pureline' ~/.bashrc; then
    echo 'source ~/pureline/pureline ~/.powerline.conf' >> ~/.bashrc
fi

wait
