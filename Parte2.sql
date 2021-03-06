--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNRTY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNRTY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_1" ("ORDER_ID", "PURCHASE_AMOUNT", "CUSTOMER_NAME", "COUNRTY") AS 
  SELECT ORDERS.ID AS order_id, ORDERS.AMOUNT as purchase_amount, CUSTOMERS.NAME as customer_name, CUSTOMERS.COUNRTY FROM ORDERS INNER JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.ID
WHERE ORDERS.AMOUNT BETWEEN 500 AND 2000
--------------------------------------------------------
--  DDL for View VIEW_2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_2" ("CUSTOMER_ID", "CUSTOMER_NAME", "CUSTOMER_COUNTRY", "SALESMAN_ID", "SALESMAN_NAME", "SALESMAN_COUNTRY", "SALESMAN_COMMISSION") AS 
  SELECT CUSTOMERS.ID AS customer_id, CUSTOMERS.NAME AS customer_name, CUSTOMERS.COUNRTY AS customer_country, SALESMAN.ID AS salesman_id, SALESMAN.NAME AS salesman_name, SALESMAN.COUNRTY AS salesman_country, SALESMAN.COMMISSION as salesman_commission FROM CUSTOMERS INNER JOIN SALESMAN ON CUSTOMERS.SALESMAN_ID = SALESMAN.ID 
WHERE SALESMAN.COMMISSION > 12
--------------------------------------------------------
--  DDL for Index SYS_C0011733
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011733" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C0011734
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011734" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C0011736
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C0011736" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "FK_SALESMAN_ID" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "FK_CUSTOMER_ID" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
 
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "FK_SALESMANC_ID" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
