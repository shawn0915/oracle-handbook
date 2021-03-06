# Listener


## Listener Control utility commands
`LSNRCTL`

- 使用命令启动和停止监听器

```bash
# linux
lsnrctl
# windows
lsnrctl.exe
```

- 语法

```bash
lsnrctl START|STOP <监听器名称>
```

在listener.ora中查看到已经定义的监听器名称。默认监听器的名称为LISTENER。

- 关闭监听器LISTENER命令
```bash
lsnrctl STOP LISTENER
```

- 侦听器状态
```bash
[oracle@localhost ~]$ lsnrctl status

LSNRCTL for Linux: Version 11.2.0.2.0 - Production on 14-9月 -2017 11:09:46

Copyright (c) 1991, 2011, Oracle.  All rights reserved.

正在连接到 (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC_FOR_XE)))
LISTENER 的 STATUS
------------------------
别名                      LISTENER
版本                      TNSLSNR for Linux: Version 11.2.0.2.0 - Production
启动日期                  12-9月 -2017 10:41:39
正常运行时间              2 天 0 小时 28 分 6 秒
跟踪级别                  off
安全性                    ON: Local OS Authentication
SNMP                      OFF
默认服务           XE
监听程序参数文件          /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
监听程序日志文件          /u01/app/oracle/product/11.2.0/xe/log/diag/tnslsnr/localhost/listener/alert/log.xml
监听端点概要...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC_FOR_XE)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=localhost)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=localhost)(PORT=8081))(Presentation=HTTP)(Session=RAW))
服务摘要..
服务 "PLSExtProc" 包含 1 个实例。
  实例 "PLSExtProc", 状态 UNKNOWN, 包含此服务的 1 个处理程序...
服务 "XE" 包含 1 个实例。
  实例 "XE", 状态 READY, 包含此服务的 1 个处理程序...
服务 "XEXDB" 包含 1 个实例。
  实例 "XE", 状态 READY, 包含此服务的 1 个处理程序...
命令执行成功
[oracle@localhost ~]$ 
```

- 其他注意项

如果侦听器没有继续运行，那么不能启动任何新的服务器进程，但这不会影响已经建立的任何会话。

如果没有使用RAC，那么侦听器与实例必须在同一台计算机上运行。
在RAC环境中，集群中任何计算机上的任何侦听器都能够连接任何计算机上的任何实例。
