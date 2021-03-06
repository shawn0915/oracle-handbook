# Backup and Recovery

- [Backup](#backup)
- [Recovery](#recovery)
- [备份和恢复配置](backup.md)
- [RMAN](rman/RMAN.md)
- [用户管理的备份、还原和恢复](user_mgmt_backup.md)
- [Flashback闪回](Flashback/Flashback.md)
- [数据迁移](DataTrans/Readme.md)
- [Data Pump](DataPump/DataPump.md)


## Backup

### 类型

- 物理备份
- 逻辑备份

### 方式

- 数据库整体备份
- 表空间备份
- 数据文件备份
- 控制文件备份 pfile
```oracle
show parameter spfile;
show parameter pfile;
```
- 文档日志备份

Oracle Secure Backup：管理整个环境的备份：Oracle应用服务器、远程客户端、操作系统文件和数据库。

> 冷备份、热备份

冷备份 —— <归档，非归档>
数据库必须停止，必须备份所有文件
1. 停止数据库（不能以abort方式停止）
2. 备份数据文件、日志文件、控制文件
3. 启动数据库


热备份 —— <归档>
无需停止数据库，以表空间为单位备份
1. 将表空间设置为begin backup
2. 备份相应数据文件
3. 将表空间设置为end backup


## Recovery

### 完全恢复

- 使受损的数据文件脱机
- 还原受损文件
- 恢复受损文件
- 使恢复的文件联机

如果处于非归档日志模式下，那数据文件丢失后的唯一选择是还原整个数据库或删除相关的表空间。不能进行恢复。

### 不完全恢复

必须以SYSDBA身份连接进行不完整恢复。普通用户和SYSOPER用户都不行。
任何SET命令(如SET UNTIL/SET NEWNAME/SET DBID)只能在run块中执行，而不能在RMAN提示符下座位单独命令执行。

### 全部文件丢失利用RMAN全备的恢复


### 利用trace文件恢复控制文件


### 只读表空间恢复


> 恢复

非归档数据库：
冷备份结果进行恢复，只能恢复到备份时时间点。

归档数据库：
可以恢复到发生问题的时间点。

1、普通数据文件，数据库正常运行
- 表空间脱机 offline
- 拷贝上次热备份的文件
- recover tablespace 表空间名称
- 表空间联机 online
  
2、普通数据文件，数据库关闭状态
- 启动数据到Mount状态
- 数据文件脱机
- 拷贝热备份文件
- recover datafile 数据文件名
- 数据文件联机
   
3、系统数据文件，数据库关闭状态
- 启动数据到Mount状态
- 拷贝热备份文件
- recover datafile 数据文件名



==============================================================================================


## 备份/恢复工具

- exp/imp
- expdp/impdp 数据泵
- exp+pipe


## 灾备

- [Data Guard](Data%20Guard/Readme.md)



> 执行数据库备份

```oracle
RMAN 简单配置
RMAN 全库备份
备份控制文件
```


> 执行数据库恢复

```oracle
控制文件版本不一致的错误
丢失一个控制文件的错误
恢复redo成员
rman 恢复 system 表空间
归档模式恢复非关键数据文件
```

> 恢复非关键性丢失

```oracle
丢失临时表空间数据文件
丢失非当前日志组
丢失所有日志组
丢失当前日志组成员
索引表空间丢失
重建口令文件
丢失密码文件
```


> 处理数据库损坏

- DBVERIFY
- NALYZE
- DBMS_REPAIR

