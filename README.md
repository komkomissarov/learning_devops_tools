# learning_devops_tools
Различные конфиги для DevOps инструментов, которые поднимают готовые конфигурации. 

# nginx_deploy
    packer_ubuntu20 - конфиги для сборки виртуалки на VMWare (тестировалось на VMware WorkstationPro 16);
    ВМ собирается с ОС Ubuntu 20.04, ставится часовой пояс МСК, созданный user сразу заносится в sudoers с NOPASSWD, выполняется обновление ОС и установка docker.io vim htop python. 
    Packer 1.7.0, Win10 21H1, Powershell. 

    Ansible - плейбук со всем необходимым, чтобы поднять на ВМ Nginx, с которого будут доступны сайты test1.com, test2.com, test3.com. Конфиги для Nginx и index.html для каждого сайта создается через модуль template. 
    Ansible подключается к хосту по ssh ключу, который закладывается Packer при создании ВМ. 