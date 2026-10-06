 CREATE TABLE SELLER (
        SELLER_ID NUMBER(5) PRIMARY KEY,
        SELLER_NAME VARCHAR2(100) NOT NULL,
        SELLER_EMAIL VARCHAR2(100) UNIQUE,
        CONTACT_NUMBER VARCHAR2(15) UNIQUE,
       BUSINESS_TYPE VARCHAR2(50) NOT NULL
   );

Table created.

 CREATE TABLE INVENTORY (
       INVENTORY_ID NUMBER(5) PRIMARY KEY,
       PRODUCT_ID NUMBER(5),
        SELLER_ID NUMBER(5),
        STOCK_QUANTITY NUMBER(5) NOT NULL,
        STOCK_STATUS VARCHAR2(20) NOT NULL,
        LAST_UPDATED DATE NOT NULL,
        CONSTRAINT FK_INVENTORY_PRODUCT
        FOREIGN KEY (PRODUCT_ID)
       REFERENCES SHOP_PRODUCT(PRODUCT_ID),
       CONSTRAINT FK_INVENTORY_SELLER
       FOREIGN KEY (SELLER_ID)
       REFERENCES SELLER(SELLER_ID)
  );

Table created.


 INSERT INTO SELLER
    VALUES (201, 'Tech World', 'techworld@gmail.com', '9876543210', 'Electronics');

1 row created.


 INSERT INTO SELLER
   VALUES (202, 'Fashion Hub', 'fashionhub@gmail.com', '9876543211', 'Fashion');

1 row created.


 INSERT INTO SELLER
    VALUES (203, 'Home Needs', 'homeneeds@gmail.com', '9876543212', 'Home Appliances');

1 row created.


 INSERT INTO SELLER
    VALUES (204, 'Style Store', 'stylestore@gmail.com', '9876543213', 'Fashion');

1 row created.

 INSERT INTO SELLER
    VALUES (205, 'Smart Shop', 'smartshop@gmail.com', '9876543214', 'Electronics');

1 row created.

 COMMIT;

Commit complete.


 INSERT INTO INVENTORY
    VALUES (301, 102, 202, 25, 'AVAILABLE',
    TO_DATE('17-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO INVENTORY
    VALUES (302, 103, 201, 40, 'AVAILABLE',
    TO_DATE('17-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO INVENTORY
    VALUES (303, 104, 204, 30, 'AVAILABLE',
   TO_DATE('17-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO INVENTORY
   VALUES (304, 105, 203, 20, 'AVAILABLE',
   TO_DATE('17-09-2026','DD-MM-YYYY'));

1 row created.


 INSERT INTO INVENTORY
    VALUES (305, 106, 206, 20, 'AVAILABLE',
    TO_DATE('17-09-2026','DD-MM-YYYY'));

1 row created.


 COMMIT;

Commit complete.

 SELECT
       S.SELLER_ID,
       S.SELLER_NAME,
      P.PRODUCT_ID,
        P.PRODUCT_NAME,
        P.PRICE
    FROM SELLER S
    JOIN INVENTORY I
   ON S.SELLER_ID = I.SELLER_ID
  JOIN SHOP_PRODUCT P
   ON I.PRODUCT_ID = P.PRODUCT_ID;

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
       203
Home Needs
       105

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
Electric Kettle
      1299


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
       206
Home Store
       106

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
Bluetooth Speaker
      1599


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
       202
Fashion Hub
       102

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
Smart Watch
      2999


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
       201
Tech World
       103

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
Cotton Shirt
       899


 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
       204
Style Store
       104

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE
----------
Denim Jeans
      1499


SELECT
        I.INVENTORY_ID,
        P.PRODUCT_ID,
        P.PRODUCT_NAME,
        I.STOCK_QUANTITY,
       I.STOCK_STATUS
    FROM INVENTORY I
    JOIN SHOP_PRODUCT P
    ON I.PRODUCT_ID = P.PRODUCT_ID
   WHERE I.STOCK_STATUS = 'AVAILABLE';

INVENTORY_ID PRODUCT_ID
------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
         304        105
Electric Kettle
            20 AVAILABLE

         305        106
Bluetooth Speaker
            20 AVAILABLE

INVENTORY_ID PRODUCT_ID
------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------

         301        102
Smart Watch
            25 AVAILABLE

         302        103
Cotton Shirt

INVENTORY_ID PRODUCT_ID
------------ ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS
-------------- --------------------
            40 AVAILABLE

         303        104
Denim Jeans
            30 AVAILABLE

SQL> SELECT
        I.INVENTORY_ID,
        P.PRODUCT_ID,
        P.PRODUCT_NAME,
        I.STOCK_QUANTITY,
        I.STOCK_STATUS
    FROM INVENTORY I
    JOIN SHOP_PRODUCT P
    ON I.PRODUCT_ID = P.PRODUCT_ID
   WHERE I.STOCK_STATUS = 'UNAVAILABLE';

no rows selected


 UPDATE INVENTORY
    SET STOCK_QUANTITY = 50,
        STOCK_STATUS = 'AVAILABLE',
        LAST_UPDATED = TO_DATE('18-09-2026','DD-MM-YYYY')
    WHERE INVENTORY_ID = 301;

1 row updated.

 COMMIT;

Commit complete.

 SELECT *
    FROM INVENTORY
    WHERE INVENTORY_ID = 301;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
------------ ---------- ---------- -------------- -------------------- ---------
         301        102        202             50 AVAILABLE            18-SEP-26


 SELECT
      I.INVENTORY_ID,
       S.SELLER_NAME,
       P.PRODUCT_NAME,
       I.STOCK_QUANTITY,
        I.STOCK_STATUS,
        I.LAST_UPDATED
    FROM INVENTORY I
    JOIN SELLER S
   ON I.SELLER_ID = S.SELLER_ID
  JOIN SHOP_PRODUCT P
  ON I.PRODUCT_ID = P.PRODUCT_ID
   ORDER BY I.INVENTORY_ID;

INVENTORY_ID
------------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
-------------- -------------------- ---------
         301
Fashion Hub
Smart Watch
            50 AVAILABLE            18-SEP-26


INVENTORY_ID
------------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
-------------- -------------------- ---------
         302
Tech World
Cotton Shirt
            40 AVAILABLE            17-SEP-26


INVENTORY_ID
------------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
-------------- -------------------- ---------
         303
Style Store
Denim Jeans
            30 AVAILABLE            17-SEP-26


INVENTORY_ID
------------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
-------------- -------------------- ---------
         304
Home Needs
Electric Kettle
            20 AVAILABLE            17-SEP-26


INVENTORY_ID
------------
SELLER_NAME
--------------------------------------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
STOCK_QUANTITY STOCK_STATUS         LAST_UPDA
-------------- -------------------- ---------
         305
Home Store
Bluetooth Speaker
            20 AVAILABLE            17-SEP-26


 SELECT
       STOCK_STATUS,
        COUNT(*) AS PRODUCT_COUNT
    FROM INVENTORY
    GROUP BY STOCK_STATUS;

STOCK_STATUS         PRODUCT_COUNT
-------------------- -------------
AVAILABLE                5

 SELECT
        S.SELLER_ID,
        S.SELLER_NAME,
        SUM(I.STOCK_QUANTITY) AS TOTAL_STOCK
    FROM SELLER S
    JOIN INVENTORY I
    ON S.SELLER_ID = I.SELLER_ID
    GROUP BY S.SELLER_ID, S.SELLER_NAME
    ORDER BY S.SELLER_ID;

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------
       201
Tech World
         40

       202
Fashion Hub
         50

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------

       203
Home Needs
         20

       204
Style Store

 SELLER_ID
----------
SELLER_NAME
--------------------------------------------------------------------------------
TOTAL_STOCK
-----------
         30

       206
Home Store
         20


 SELECT
       I.INVENTORY_ID,
        P.PRODUCT_ID,
        P.PRODUCT_NAME,
       S.SELLER_NAME,
        I.STOCK_QUANTITY,
      I.STOCK_STATUS
  FROM INVENTORY I
  JOIN SHOP_PRODUCT P
  ON I.PRODUCT_ID = P.PRODUCT_ID
   JOIN SELLER S
   ON I.SELLER_ID = S.SELLER_ID
   WHERE I.STOCK_QUANTITY = 0;

no rows selected

