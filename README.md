# Acesso ao internet banking no Linux usando um Container Toolbox 
Para quem usa internet banking no Linux sabe que é necessário o módulo de segurança Warsaw, este módulo além de mal projetado, tem um contrato de licença obscuro que coleta muitas informações do usuário, portanto muitos usuários usam ele em uma VM para evitar ficar com esse software rodando em segundo plano, veja um trecho do contratado de licença abaixo. 

![Contrato](https://imgur.com/iSBBINs)

Pensando em facilitar a vida de quem usa Fedora que já vem por padrão com o Toolbox, um mecanismo para criar contêineres de forma simples, eu fiz uma imagem de contêiner contendo esse módulo de segurança e o Firefox para ser possível acessar os bancos com tranquilidade.  

O container foi testado no Fedora, mas acredito que deve funcionar em qualquer distro que contém o Toolbox no repositório. 

# Passsos para instação 

# Video de demostração 
