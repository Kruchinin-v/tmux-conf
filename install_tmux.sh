!/bin/bash

echo "Установка конфига .tmux"

#Удалить старые конфигурации
rm -rf ~/.tmux ~/.tmux.conf ~/.tmux.conf.local > /dev/null

cp -r ./tmux ~/.tmux

ln -s ~/.tmux/.tmux.conf ~/ && \
    cp ~/.tmux/.tmux.conf.local ~/ && \
    echo "Ok"

echo "alias tmux='tmux -2'" >> ~/.bashrc
source ~/.bashrc
