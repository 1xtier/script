## srvtools
#### Работа со скриптом
```bash
srvtools [options] [options]
Usage: srvtools [options]
    -s, --servers servers            We specify the server name: -s/--servers=name.server
    -c, --command Command            Enter the name of the command: -c/--command='!command'
```
- флаг -s name server --server=name server
- флаг -c 'command' --command='command' тут важно подметить что команду нужно передать в одиночных ковычках иначе могут не отработать флагы выполняемой команды!
#### конфиг файл 

#### Файл с хостами

```yaml
dev: <- тут название вашего сервер можно указать hostname
  hostname: <- тут айпи адресс
  port: <- порт по каторому будем подключаться
```