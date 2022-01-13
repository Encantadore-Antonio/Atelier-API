

COPY reviews
FROM '/Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/reviews.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM '//Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/styles.csv'
DELIMITER ','
CSV HEADER;

COPY product
FROM '/Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/product.csv'
DELIMITER ','
CSV HEADER;

COPY features
FROM '/Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/features.csv'
DELIMITER ','
CSV HEADER;

COPY photos
FROM '/Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/photos.csv'
DELIMITER ','
CSV HEADER;

COPY skus
FROM '/Users/ginwoopak/Desktop/hr/SDC/Product_Overview/csvData/skus.csv'
DELIMITER ','
CSV HEADER;

-- Template
-- COPY
-- FROM ''
-- DELIMITER ','
-- CSV HEADER;