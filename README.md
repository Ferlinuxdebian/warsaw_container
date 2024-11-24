# Acesso ao internet banking no Linux usando um Container Toolbox 
Para quem usa internet banking no Linux sabe que é necessário o módulo de segurança Warsaw, este módulo além de mal projetado, tem um contrato de licença obscuro que coleta muitas informações do usuário, portanto muitos usuários usam ele em uma VM para evitar ficar com esse software rodando em segundo plano, veja um trecho do contratado de licença abaixo. 

[![Captura-de-tela-de-2024-11-24-08-38-39.png](https://i.postimg.cc/d3wyJLQC/Captura-de-tela-de-2024-11-24-08-38-39.png)](https://postimg.cc/1n7tHRqR)

Pensando em facilitar a vida de quem usa Fedora que já vem por padrão com o Toolbox, um mecanismo para criar Containers de forma simples, eu fiz uma imagem de Container contendo esse módulo de segurança e o Firefox para ser possível acessar os bancos com tranquilidade.  

O container foi testado no Fedora, mas acredito que deve funcionar em qualquer distro que contém o Toolbox no repositório. 

# Passsos para instação 
Copia os comandos e cole no terminal (não precisa ser root, tampouco usar o comando sudo)
```
git clone https://github.com/Ferlinuxdebian/warsaw_container.git 
cd warsaw_container/                                             
chmod +x install.sh                                              
./install.sh
```
Se você quiser remover basta:
```
toolbox rmi warsaw_toolbox --force
```
# Video de demostração 
[![Vídeo](https://i.imgur.com/ShpHdvG.jpg)](https://i.imgur.com/ShpHdvG.mp4)
