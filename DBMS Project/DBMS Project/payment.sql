 CREATE TABLE SAVANA_PAYMENT (
        PAYMENT_ID NUMBER(5) PRIMARY KEY,
        ORDER_ID NUMBER(5),
        CUSTOMER_ID NUMBER(5),
        PAYMENT_MODE VARCHAR2(30),
        PAYMENT_DATE DATE,
        AMOUNT NUMBER(10,2),
        PAYMENT_STATUS VARCHAR2(30),
        CONSTRAINT FK_PAYMENT_ORDER
       FOREIGN KEY (ORDER_ID)
       REFERENCES SAVANA_ORDERS(ORDER_ID)
   );

Table created.


 INSERT INTO SAVANA_PAYMENT
    VALUES (501, 1001, 101, 'UPI',
    TO_DATE('21-09-2026','DD-MM-YYYY'),
    25998.00, 'Successful');

1 row created.

 INSERT INTO SAVANA_PAYMENT
    VALUES (502, 1002, 102, 'Credit Card',
    TO_DATE('21-09-2026','DD-MM-YYYY'),
    1999.00, 'Successful');

1 row created.


 INSERT INTO SAVANA_PAYMENT
    VALUES (503, 1003, 103, 'Debit Card',
    TO_DATE('20-09-2026','DD-MM-YYYY'),
    1598.00, 'Successful');

1 row created.

 COMMIT;

Commit complete.


 SELECT *
    FROM SAVANA_PAYMENT
   WHERE PAYMENT_STATUS = 'Successful';

PAYMENT_ID   ORDER_ID CUSTOMER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ----------- ------------------------------ ---------
    AMOUNT PAYMENT_STATUS
---------- ------------------------------
       501       1001         101 UPI                            21-SEP-26
     25998 Successful

       502       1002         102 Credit Card                    21-SEP-26
      1999 Successful

       503       1003         103 Debit Card                     20-SEP-26
      1598 Successful


 SELECT
       PAYMENT_ID,
        ORDER_ID,
        CUSTOMER_ID,
        PAYMENT_MODE,
       AMOUNT,
        PAYMENT_STATUS
  FROM SAVANA_PAYMENT
  WHERE PAYMENT_STATUS = 'Successful';

PAYMENT_ID   ORDER_ID CUSTOMER_ID PAYMENT_MODE                       AMOUNT
---------- ---------- ----------- ------------------------------ ----------
PAYMENT_STATUS
------------------------------
       501       1001         101 UPI                                 25998
Successful

       502       1002         102 Credit Card                          1999
Successful

       503       1003         103 Debit Card                           1598
Successful

 SELECT
        PAYMENT_ID,
        ORDER_ID,
        CUSTOMER_ID,
        PAYMENT_MODE,
        AMOUNT,
        PAYMENT_STATUS
    FROM SAVANA_PAYMENT
    WHERE PAYMENT_STATUS = 'Failed';

no rows selected

 UPDATE SAVANA_PAYMENT
    SET PAYMENT_STATUS = 'Successful'
    WHERE PAYMENT_ID = 504;

0 rows updated.


 COMMIT;

Commit complete.


 SELECT *
    FROM SAVANA_PAYMENT
    WHERE PAYMENT_ID = 504;

no rows selected

 SELECT
        PAYMENT_MODE,
        COUNT(*) AS TOTAL_TRANSACTIONS
    FROM SAVANA_PAYMENT
    GROUP BY PAYMENT_MODE;

PAYMENT_MODE                   TOTAL_TRANSACTIONS
------------------------------ ------------------
UPI                                             1
Credit Card                                     1
Debit Card                                      1

 SELECT
        PAYMENT_MODE,
        SUM(AMOUNT) AS TOTAL_AMOUNT
    FROM SAVANA_PAYMENT
    GROUP BY PAYMENT_MODE;

PAYMENT_MODE                   TOTAL_AMOUNT
------------------------------ ------------
UPI                                   25998
Credit Card                            1999
Debit Card                             1598

 SELECT
        P.PAYMENT_ID,
        P.ORDER_ID,
        P.CUSTOMER_ID,
        P.PAYMENT_MODE,
        P.PAYMENT_DATE,
        P.AMOUNT,
        P.PAYMENT_STATUS
    FROM SAVANA_PAYMENT P
   ORDER BY P.PAYMENT_ID;

PAYMENT_ID   ORDER_ID CUSTOMER_ID PAYMENT_MODE                   PAYMENT_D
---------- ---------- ----------- ------------------------------ ---------
    AMOUNT PAYMENT_STATUS
---------- ------------------------------
       501       1001         101 UPI                            21-SEP-26
     25998 Successful

       502       1002         102 Credit Card                    21-SEP-26
      1999 Successful

       503       1003         103 Debit Card                     20-SEP-26
      1598 Successful


 