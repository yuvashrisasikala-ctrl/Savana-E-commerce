SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      O.TOTAL_AMOUNT,
  7      O.ORDER_STATUS
  8  FROM SAVANA_CUSTOMER C
  9  INNER JOIN SAVANA_ORDERS O
 10  ON C.CUSTOMER_ID = O.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        101 Arun                                                     1001
22-SEP-26        26998 Confirmed

        102 Priya                                                    1002
21-SEP-26         1999 Shipped

        103 Kumar                                                    1003
20-SEP-26         1598 Delivered


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        101 Arun                                                     9001
23-OCT-26        15999 Confirmed


SQL> SELECT
  2      O.ORDER_ID,
  3      O.CUSTOMER_ID,
  4      O.TOTAL_AMOUNT,
  5      P.PAYMENT_ID,
  6      P.PAYMENT_MODE,
  7      P.AMOUNT,
  8      P.PAYMENT_STATUS
  9  FROM SAVANA_ORDERS O
 10  INNER JOIN SAVANA_PAYMENT P
 11  ON O.ORDER_ID = P.ORDER_ID;

  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT PAYMENT_ID PAYMENT_MODE
---------- ----------- ------------ ---------- ------------------------------
    AMOUNT PAYMENT_STATUS
---------- ------------------------------
      1001         101        26998        501 UPI
     25998 Successful

      1002         102         1999        502 Credit Card
      1999 Successful

      1003         103         1598        503 Debit Card
      1598 Successful

SQL> SELECT P.PRODUCT_ID,
  2         P.PRODUCT_NAME,
  3         D.ORDER_ID,
  4         D.QUANTITY,
  5         D.UNIT_PRICE,
  6         D.TOTAL_AMOUNT
  7  FROM SHOP_PRODUCT P
  8  INNER JOIN SAVANA_ORDER_DETAILS D
  9  ON P.PRODUCT_ID = D.PRODUCT_ID;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  ORDER_ID   QUANTITY UNIT_PRICE TOTAL_AMOUNT
---------- ---------- ---------- ------------
       201
T-Shirt
      1001          1        999          999


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      O.TOTAL_AMOUNT
  7  FROM SAVANA_CUSTOMER C
  8  LEFT JOIN SAVANA_ORDERS O
  9  ON C.CUSTOMER_ID = O.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT
--------- ------------
        101 Arun                                                     1001
22-SEP-26        26998

        102 Priya                                                    1002
21-SEP-26         1999

        103 Kumar                                                    1003
20-SEP-26         1598


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT
--------- ------------
        101 Arun                                                     9001
23-OCT-26        15999


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      O.TOTAL_AMOUNT,
  7      O.ORDER_STATUS
  8  FROM SAVANA_CUSTOMER C
  9  RIGHT JOIN SAVANA_ORDERS O
 10  ON C.CUSTOMER_ID = O.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        101 Arun                                                     1001
22-SEP-26        26998 Confirmed

        101 Arun                                                     9001
23-OCT-26        15999 Confirmed

        102 Priya                                                    1002
21-SEP-26         1999 Shipped


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        103 Kumar                                                    1003
20-SEP-26         1598 Delivered


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      P.PRODUCT_NAME,
  7      D.QUANTITY,
  8      D.UNIT_PRICE,
  9      D.TOTAL_AMOUNT,
 10      PY.PAYMENT_MODE,
 11      PY.PAYMENT_STATUS
 12  FROM SAVANA_CUSTOMER C
 13  JOIN SAVANA_ORDERS O
 14  ON C.CUSTOMER_ID = O.CUSTOMER_ID
 15  JOIN SAVANA_ORDER_DETAILS D
 16  ON O.ORDER_ID = D.ORDER_ID
 17  JOIN SAVANA_PRODUCT P
 18  ON D.PRODUCT_ID = P.PRODUCT_ID
 19  LEFT JOIN SAVANA_PAYMENT PY
 20  ON O.ORDER_ID = PY.ORDER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE TOTAL_AMOUNT PAYMENT_MODE
---------- ---------- ------------ ------------------------------
PAYMENT_STATUS
------------------------------
        101 Arun                                                     1001
22-SEP-26
T-Shirt

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY UNIT_PRICE TOTAL_AMOUNT PAYMENT_MODE
---------- ---------- ------------ ------------------------------
PAYMENT_STATUS
------------------------------
         1        999          999 UPI
Successful


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      P.PRODUCT_NAME,
  7      D.QUANTITY,
  8      D.TOTAL_AMOUNT
  9  FROM SAVANA_CUSTOMER C
 10  JOIN SAVANA_ORDERS O
 11  ON C.CUSTOMER_ID = O.CUSTOMER_ID
 12  JOIN SAVANA_ORDER_DETAILS D
 13  ON O.ORDER_ID = D.ORDER_ID
 14  JOIN SAVANA_PRODUCT P
 15  ON D.PRODUCT_ID = P.PRODUCT_ID
 16  ORDER BY C.CUSTOMER_ID, O.ORDER_DATE;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY TOTAL_AMOUNT
---------- ------------
        101 Arun                                                     1001
22-SEP-26
T-Shirt
         1          999


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      O.ORDER_ID,
  5      O.ORDER_DATE,
  6      O.TOTAL_AMOUNT,
  7      PY.PAYMENT_MODE,
  8      PY.PAYMENT_DATE,
  9      PY.PAYMENT_STATUS
 10  FROM SAVANA_CUSTOMER C
 11  JOIN SAVANA_ORDERS O
 12  ON C.CUSTOMER_ID = O.CUSTOMER_ID
 13  LEFT JOIN SAVANA_PAYMENT PY
 14  ON O.ORDER_ID = PY.ORDER_ID
 15  ORDER BY C.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT PAYMENT_MODE                   PAYMENT_D
--------- ------------ ------------------------------ ---------
PAYMENT_STATUS
------------------------------
        101 Arun                                                     1001
22-SEP-26        26998 UPI                            21-SEP-26
Successful

        101 Arun                                                     9001
23-OCT-26        15999


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT PAYMENT_MODE                   PAYMENT_D
--------- ------------ ------------------------------ ---------
PAYMENT_STATUS
------------------------------

        102 Priya                                                    1002
21-SEP-26         1999 Credit Card                    21-SEP-26
Successful

        103 Kumar                                                    1003
20-SEP-26         1598 Debit Card                     20-SEP-26

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT PAYMENT_MODE                   PAYMENT_D
--------- ------------ ------------------------------ ---------
PAYMENT_STATUS
------------------------------
Successful


SQL> SELECT
  2      C.CUSTOMER_ID,
  3      C.CUSTOMER_NAME,
  4      COUNT(DISTINCT O.ORDER_ID) AS TOTAL_ORDERS,
  5      SUM(D.TOTAL_AMOUNT) AS TOTAL_PURCHASE_AMOUNT
  6  FROM SAVANA_CUSTOMER C
  7  JOIN SAVANA_ORDERS O
  8  ON C.CUSTOMER_ID = O.CUSTOMER_ID
  9  JOIN SAVANA_ORDER_DETAILS D
 10  ON O.ORDER_ID = D.ORDER_ID
 11  GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
 12  ORDER BY TOTAL_PURCHASE_AMOUNT DESC;

CUSTOMER_ID CUSTOMER_NAME                                      TOTAL_ORDERS
----------- -------------------------------------------------- ------------
TOTAL_PURCHASE_AMOUNT
---------------------
        101 Arun                                                          1
                  999


SQL> SELECT
  2      P.PAYMENT_ID,
  3      P.ORDER_ID,
  4      P.CUSTOMER_ID,
  5      C.CUSTOMER_NAME,
  6      P.PAYMENT_MODE,
  7      P.PAYMENT_DATE,
  8      P.AMOUNT,
  9      P.PAYMENT_STATUS
 10  FROM SAVANA_PAYMENT P
 11  LEFT JOIN SAVANA_CUSTOMER C
 12  ON P.CUSTOMER_ID = C.CUSTOMER_ID
 13  ORDER BY P.PAYMENT_DATE DESC;

PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D     AMOUNT
------------------------------ --------- ----------
PAYMENT_STATUS
------------------------------
       501       1001         101
Arun
UPI                            21-SEP-26      25998
Successful


PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D     AMOUNT
------------------------------ --------- ----------
PAYMENT_STATUS
------------------------------
       502       1002         102
Priya
Credit Card                    21-SEP-26       1999
Successful


PAYMENT_ID   ORDER_ID CUSTOMER_ID
---------- ---------- -----------
CUSTOMER_NAME
--------------------------------------------------
PAYMENT_MODE                   PAYMENT_D     AMOUNT
------------------------------ --------- ----------
PAYMENT_STATUS
------------------------------
       503       1003         103
Kumar
Debit Card                     20-SEP-26       1598
Successful


