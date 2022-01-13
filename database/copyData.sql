

COPY reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/styles.csv'
DELIMITER ','
CSV HEADER;

COPY product
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/product.csv'
DELIMITER ','
CSV HEADER;

COPY features
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/features.csv'
DELIMITER ','
CSV HEADER;

COPY photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/photos.csv'
DELIMITER ','
CSV HEADER;

COPY skus
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/skus.csv'
DELIMITER ','
CSV HEADER;

-- Template
-- COPY
-- FROM ''
-- DELIMITER ','
-- CSV HEADER;