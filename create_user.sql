CREATE USER ok2ju IDENTIFIED BY root DEFAULT TABLESPACE USERS
	QUOTA UNLIMITED ON USERS
	/

GRANT CREATE SESSION TO ok2ju
/
GRANT CREATE TABLE TO ok2ju
/
GRANT CREATE PROCEDURE TO ok2ju
/
GRANT CREATE TRIGGER TO ok2ju
/
GRANT CREATE VIEW TO ok2ju
/
GRANT CREATE SEQUENCE TO ok2ju
/
GRANT CREATE VIEW TO ok2ju
/
GRANT CREATE TYPE TO ok2ju
/

GRANT DELETE ANY TABLE TO ok2ju
/
GRANT DROP ANY TABLE TO ok2ju
/
GRANT DROP ANY PROCEDURE TO ok2ju
/
GRANT DROP ANY TRIGGER TO ok2ju
/
GRANT DROP ANY VIEW TO ok2ju
/

GRANT ALTER ANY TABLE TO ok2ju
/
GRANT ALTER ANY TABLE TO ok2ju
/
GRANT ALTER ANY PROCEDURE TO ok2ju
/
GRANT ALTER ANY TRIGGER TO ok2ju
/
GRANT ALTER ANY TYPE TO ok2ju
/

COMMIT
/

/* --------------- connect --------------- */
/* connect ok2ju/root@orcl */