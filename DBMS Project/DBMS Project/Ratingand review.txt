  CREATE TABLE SAVANA_REVIEW (
        REVIEW_ID NUMBER(5) PRIMARY KEY,
        CUSTOMER_ID NUMBER(5),
      PRODUCT_ID NUMBER(5),
       REVIEW_TEXT VARCHAR2(500) NOT NULL,
       REVIEW_DATE DATE NOT NULL
   );

    CREATE TABLE SAVANA_RATING (
        RATING_ID NUMBER(5) PRIMARY KEY,
        CUSTOMER_ID NUMBER(5),
        PRODUCT_ID NUMBER(5),
        RATING NUMBER(1) NOT NULL,
        RATING_DATE DATE NOT NULL
    );

Table created;

 INSERT INTO SAVANA_REVIEW
    VALUES
    (1, 101, 201, 'Very good quality product',
   TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_REVIEW
    VALUES
    (2, 102, 202, 'Good product and nice quality',
    TO_DATE('23-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_REVIEW
    VALUES
    (3, 103, 203, 'Product is worth the price',
   TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_REVIEW
    VALUES
    (4, 101, 204, 'Good product but delivery was late',
   TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_REVIEW
    VALUES
    (5, 104, 205, 'Excellent product and quality',
   TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.



 INSERT INTO SAVANA_RATING
    VALUES
    (501, 101, 201, 5,
    TO_DATE('22-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_RATING
    VALUES
    (502, 102, 202, 4,
   TO_DATE('23-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_RATING
    VALUES
    (503, 103, 203, 5,
   TO_DATE('24-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_RATING
    VALUES
    (504, 101, 204, 3,
   TO_DATE('25-09-2026','DD-MM-YYYY'));

1 row created.

 INSERT INTO SAVANA_RATING
    VALUES
    (505, 104, 205, 5,
    TO_DATE('26-09-2026','DD-MM-YYYY'));

1 row created.

 COMMIT;

Commit complete.



 SELECT
        REVIEW_ID,
        CUSTOMER_ID,
        PRODUCT_ID,
        REVIEW_TEXT,
        REVIEW_DATE
    FROM SAVANA_REVIEW;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1         101        201
Very good quality product
22-SEP-26

         2         102        202
Good product and nice quality
23-SEP-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

         3         103        203
Product is worth the price
24-SEP-26

         4         101        204
Good product but delivery was late

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
25-SEP-26

         5         104        205
Excellent product and quality
26-SEP-26


 SELECT
      PRODUCT_ID,
       AVG(RATING) AS AVERAGE_RATING
   FROM SAVANA_RATING
   GROUP BY PRODUCT_ID;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       201              5
       202              4
       203              5
       204              3
       205              5

 SELECT
        PRODUCT_ID,
       AVG(RATING) AS AVERAGE_RATING
    FROM SAVANA_RATING
    GROUP BY PRODUCT_ID
    HAVING AVG(RATING) >= 4;

PRODUCT_ID AVERAGE_RATING
---------- --------------
       201              5
       202              4
       203              5
       205              5


 SELECT
        P.PRODUCT_ID,
      P.PRODUCT_NAME,
        AVG(R.RATING) AS AVERAGE_RATING
    FROM SAVANA_PRODUCT P
    JOIN SAVANA_RATING R
    ON P.PRODUCT_ID = R.PRODUCT_ID
    GROUP BY
        P.PRODUCT_ID,
       P.PRODUCT_NAME;

no rows selected
