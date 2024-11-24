#!/bin/bash

# Baixa o ícone usado na aplicação de desktop
local="/home/$USER/.local/share"
icon="https://gcdnb.pbrd.co/images/lF9GlyNVzpIk.png?o=1"
desktop_location="/home/$USER/.local/share/applications/internet-banking.desktop"
cd $local

if wget -O dinheiro.png $icon &>/dev/null; then
	echo -e 'Configurando o ícone na área de trabalho \033[0;32m[OK]\033[0m'
cat << EOF > $desktop_location
[Desktop Entry]
Version=1.1
Type=Application
Name=Internet Banking
Comment=Acesso aos bancos via Firefox no Linux Módulo de segurança warsaw no container
Icon=/home/fernando/.local/share/dinheiro.png
Exec=toolbox run --container warsaw_container_toolbox bash -c 'sudo /usr/local/bin/warsaw/core; firefox https://seg.bb.com.br/home.html'
Actions=
Categories=Network;
EOF
else
	echo -e 'Configurando os ícones na área de trabalho \033[0;31m[ERRO]'
	exit 1
fi


# Cria a imagem com o Firefox e warsaw no container
cd $(mktemp -d)
cat << EOF > Containerfile
FROM registry.fedoraproject.org/fedora-toolbox:latest
RUN sudo dnf install libXcursor libXft firefox -y
RUN wget 'https://www.dropbox.com/scl/fi/do9mwgypkrqpn3k4p9339/warsaw-2.21.5-1.x86_64.rpm?rlkey=f5scdctyph5avghpzk4pmzc56&st=y0k55az3&dl=1' -O warsaw-2.21.5-1.x86_64.rpm
RUN dnf install ./*.rpm -y
EOF

echo "Criando a imagem do container aguarde..."
if podman build -t warsaw_toolbox . &>/dev/null; then
	echo -e 'Imagem criada \033[0;32m[OK]\033[0m'
else
	echo -e 'Imagem criada \033[0;31m[ERRO]\033[0m'
	exit 2
fi

echo "Criando o container aguarde..."
if toolbox create --image warsaw_toolbox --container warsaw_container_toolbox &>/dev/null; then
	echo -e 'Container criado \033[0;32m[OK]\033[0m'
else
	echo -e 'Container criado \033[0;31m[ERRO]\033[0m'
	exit 3
fi
