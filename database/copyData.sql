COPY product
FROM 'csvData/product.csv'
DELIMITER ','
CSV HEADER;

COPY features
FROM 'csvData/features.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM 'csvData/styles.csv'
DELIMITER ','
CSV HEADER;

COPY photos
FROM 'csvData/photos.csv'
DELIMITER ','
CSV HEADER;

COPY skus
FROM 'csvData/skus.csv'
DELIMITER ','
CSV HEADER;

-- Template
-- COPY
-- FROM ''
-- DELIMITER ','
-- CSV HEADER;