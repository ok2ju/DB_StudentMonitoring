CREATE OR REPLACE TRIGGER class_before_insert
BEFORE INSERT OR UPDATE OR DELETE
   ON Class
   FOR EACH ROW
   
DECLARE
   
BEGIN
   
   insert into Classroom values(4, 251, 3, 'ул.Щорса');
   
END;