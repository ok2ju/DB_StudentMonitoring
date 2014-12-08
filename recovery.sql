/* ------ Включение режима ARCHIVELOG ------- */
SHUTDOWN IMMEDIATE
STARTUP MOUNT
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;

set oracle_sid=orcl
echo %oracle_sid%
rman target /
backup database;
list backup;
restore database;