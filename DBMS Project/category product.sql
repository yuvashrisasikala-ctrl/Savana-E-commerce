 CREATE TABLE SAVANA_CATEGORY (
       CATEGORY_ID NUMBER(5) PRIMARY KEY,
        CATEGORY_NAME VARCHAR2(50) NOT NULL,
       DESCRIPTION VARCHAR2(100)
    );

Table created.

CREATE TABLE SAVANA_PRODUCT (
      PRODUCT_ID NUMBER(5) PRIMARY KEY,
       PRODUCT_NAME VARCHAR2(100) NOT NULL,
       CATEGORY_ID NUMBER(5),
       PRICE NUMBER(10,2) NOT NULL,
       STOCK NUMBER(5),
       BRAND VARCHAR2(50),
       COLOR VARCHAR2(30),
       PRODUCT_SIZE VARCHAR2(20),
      CONSTRAINT FK_SAVANA_PRODUCT_CATEGORY
      FOREIGN KEY (CATEGORY_ID)
       REFERENCES SHOP_CATEGORY(CATEGORY_ID)
   );

Table created.

 INSERT INTO SHOP_CATEGORY
    (CATEGORY_ID, CATEGORY_NAME, DESCRIPTION)
   VALUES (1, 'Electronics', 'Electronic products');

1 row created.


 INSERT INTO SHOP_CATEGORY
   (CATEGORY_ID, CATEGORY_NAME, DESCRIPTION)
    VALUES (2, 'Fashion', 'Fashion products');

1 row created.


 INSERT INTO SHOP_CATEGORY
   (CATEGORY_ID, CATEGORY_NAME, DESCRIPTION)
    VALUES (3, 'Home Appliances', 'Home appliance products');

1 row created.


 COMMIT;

Commit complete.


 INSERT INTO SHOP_PRODUCT
    (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK)
    VALUES (102, 'Smart Watch', 1, 2999, 15);

1 row created.


 INSERT INTO SHOP_PRODUCT
   (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK)
    VALUES (103, 'Cotton Shirt', 2, 899, 40);

1 row created.

 INSERT INTO SHOP_PRODUCT
   (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK)
    VALUES (104, 'Denim Jeans', 2, 1499, 30);

1 row created.


 INSERT INTO SHOP_PRODUCT
  2  (PRODUCT_ID, PRODUCT_NAME, CATEGORY_ID, PRICE, STOCK)
  3  VALUES (105, 'Electric Kettle', 3, 1299, 20);

1 row created.


 COMMIT;

  UPDATE SHOP_PRODUCT
   SET PRICE = 1799,
       STOCK = 30
   WHERE PRODUCT_ID = 101;

1 row updated.

 COMMIT;

  DELETE FROM SHOP_PRODUCT
   WHERE PRODUCT_ID = 105;

1 row deleted.

 COMMIT;

Commit complete.


 SELECT
       C.CATEGORY_NAME,
        P.PRODUCT_NAME,
        P.PRICE,
        P.STOCK
    FROM SHOP_CATEGORY C
    JOIN SHOP_PRODUCT P
   ON C.CATEGORY_ID = P.CATEGORY_ID
   ORDER BY C.CATEGORY_NAME;

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
Electronics
Wireless Headphones
      1799         30

Electronics
Smart Watch
      2999         15

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------

Fashion
Cotton Shirt
       899         40

Fashion
Denim Jeans

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
      1499         30


 SELECT
       C.CATEGORY_NAME,
       P.PRODUCT_NAME,
       P.PRICE,
       P.STOCK
   FROM SHOP_CATEGORY C
   JOIN SHOP_PRODUCT P
   ON C.CATEGORY_ID = P.CATEGORY_ID
    ORDER BY C.CATEGORY_NAME;

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
Electronics
Wireless Headphones
      1799         30

Electronics
Smart Watch
      2999         15

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------

Fashion
Cotton Shirt
       899         40

Fashion
Denim Jeans

CATEGORY_NAME
--------------------------------------------------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK
---------- ----------
      1499         30

 SELECT
        C.CATEGORY_NAME,
        COUNT(P.PRODUCT_ID) AS PRODUCT_COUNT
    FROM SHOP_CATEGORY C
    LEFT JOIN SHOP_PRODUCT P
    ON C.CATEGORY_ID = P.CATEGORY_ID
   GROUP BY C.CATEGORY_NAME
   ORDER BY C.CATEGORY_NAME;

CATEGORY_NAME                                      PRODUCT_COUNT
-------------------------------------------------- -------------
Electronics                                                    2
Fashion                                                        2
Home Appliances                                                0