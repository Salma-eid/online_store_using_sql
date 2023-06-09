CREATE TABLE IF NOT EXISTS SEGMENT ( 
  SEGMENT_ID INT(20) PRIMARY KEY NOT NULL,
  SEGMENT_NAME VARCHAR(25) NOT NULL  
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO SEGMENT(SEGMENT_ID,SEGMENT_NAME) VALUES
(1810,'A'),
(1811,'B'),
(1812,'C');

CREATE TABLE IF NOT EXISTS BRANDS ( 
  BRAND_ID INT(20) PRIMARY KEY NOT NULL,
  BRAND_NAME VARCHAR(25) NOT NULL,
  SEGMENT_ID INT(20)  NOT NULL,
  CONSTRAINT FOREIGN KEY (SEGMENT_ID) REFERENCES SEGMENT (SEGMENT_ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO BRANDS(BRAND_ID,BRAND_NAME,SEGMENT_ID) VALUES
(1710,'GUCCI',1810),
(1711,'TOMMEY',1811),
(1712,'NIKE',1812);


CREATE TABLE IF NOT EXISTS CATEGORY ( 
  CATEGORY_ID INT(20) PRIMARY KEY NOT NULL,
  CATEGORY_NAME VARCHAR(25)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CATEGORY(CATEGORY_ID,CATEGORY_NAME) VALUES
(1410,'MEN CLOTHES'),
(1411,'WOMEN CLOTHES');


CREATE TABLE IF NOT EXISTS PRODUCT (
  PRODUCT_ID INT(20) PRIMARY KEY NOT NULL,
  PRODUCT_NAME VARCHAR(25) NOT NULL,
  PRODUCT_MODEL VARCHAR(25) NOT NULL,
  PRODUCT_PRICE INT(20) NOT NULL,
  BRAND_ID INT(20) NOT NULL,
  CATEGORY_ID INT(20) NOT NULL,
  CONSTRAINT FOREIGN KEY (BRAND_ID) REFERENCES BRANDS (BRAND_ID),
  CONSTRAINT FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO PRODUCT(PRODUCT_ID,PRODUCT_NAME,PRODUCT_MODEL,PRODUCT_PRICE,BRAND_ID,CATEGORY_ID) VALUES
(1610,'T-SHIRT','2015',500,1710,1410),
(1611,'SWEET PANTS','2018',400,1711,1410),
(1612,'JACKET','2021',800,1712,1411);



CREATE TABLE IF NOT EXISTS CART ( 
  CART_ID INT(20) PRIMARY KEY NOT NULL,
  TOTAL_COST FLOAT(20) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CART(CART_ID,TOTAL_COST) VALUES
(1510,940.0);


CREATE TABLE IF NOT EXISTS CUSTOMER( 
  CUSTOMER_ID INT(20) PRIMARY KEY NOT NULL,
  USER_NAME VARCHAR(25) NOT NULL,
  EMAIL VARCHAR(30) NOT NULL)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO CUSTOMER(CUSTOMER_ID,USER_NAME,EMAIL) VALUES
(1310,'MANS','abdomans228@gmail.com'),
(1311,'OMAR','omarmans228@gmail.com');



CREATE TABLE IF NOT EXISTS CUSTOMER_ADDRESS ( 
  ADDRESS VARCHAR(30)  NOT NULL,
  CUSTOMER_ID INT(20) NOT NULL,
  CONSTRAINT FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
  PRIMARY KEY(ADDRESS,CUSTOMER_ID)

)ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO CUSTOMER_ADDRESS(ADDRESS,CUSTOMER_ID) VALUES
('ELAGAMY',1310),
('CALIFORNIA',1310),
('JANAKLEES',1311),
('NEW YORK',1311);


CREATE TABLE IF NOT EXISTS PAYMENT ( 
  PAYMENT_ID INT(20) PRIMARY KEY NOT NULL,
  PAYMENT_TYPE VARCHAR(20) NOT NULL,
  CART_ID INT(20)  NOT NULL,
  CUSTOMER_ID INT(20)  NOT NULL,
  CONSTRAINT FOREIGN KEY (CART_ID) REFERENCES CART (CART_ID),
  CONSTRAINT FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO PAYMENT (PAYMENT_ID,PAYMENT_TYPE,CART_ID,CUSTOMER_ID) VALUES
(1210,'CASH',1510,1310);

CREATE TABLE IF NOT EXISTS CUSTOMER_PHONE ( 
  PHONE_NUMBER VARCHAR(20) NOT NULL,
  CUSTOMER_ID INT(20)  NOT NULL,
  CONSTRAINT FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID),
  PRIMARY KEY(PHONE_NUMBER,CUSTOMER_ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CUSTOMER_PHONE(PHONE_NUMBER,CUSTOMER_ID) VALUES
('0100',1310),
('012',1310),
('011',1311),
('015',1311);

CREATE TABLE IF NOT EXISTS CARTITEM ( 
  CARTITEM_ID INT(20) PRIMARY KEY NOT NULL,
  QUANTITY INT(20) NOT NULL,
  TOTAL_COST FLOAT(20) NOT NULL,
  CART_ID INT(20)  NOT NULL,
  PRODUCT_ID INT(20)  NOT NULL,
  CONSTRAINT FOREIGN KEY (CART_ID) REFERENCES CART (CART_ID), 
  CONSTRAINT FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (PRODUCT_ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO CARTITEM(CARTITEM_ID,QUANTITY,TOTAL_COST,CART_ID,PRODUCT_ID) VALUES
(1110,1,520.0,1510,1610),
(1111,1,420.0,1510,1611);