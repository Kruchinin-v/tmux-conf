#!/bin/sh

# Install tmux 2.8 on Centos

# install deps
echo "Установка зависимостей"
yum install -y gcc kernel-devel make ncurses-devel

mkdir /usr/local/soft

echo "Установка libevent"
# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -Lk https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz -o /usr/local/soft/libevent-stable.tar.gz
cd /usr/local/soft
tar -xf libevent-stable.tar.gz
cd libevent-*
./configure --prefix=/usr/local > /dev/null && \
make > /dev/null && \
make install > /dev/null && \
echo "Ok"

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
echo "Установка tmux"
curl -Lk https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz /usr/local/soft/tmux.tar.gz  -o /usr/local/soft/tmux.tar.gz
cd /usr/local/soft
tar -xf tmux.tar.gz
cd tmux-*
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local > /dev/null && \
make > /dev/null && \
make install > /dev/null && \
echo "Ok"

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V
