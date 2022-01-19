-- ---
-- Table 'Products'
--
-- ---

-- /product.csv
-- id
-- name
-- slogan
-- description
-- category
-- default_price

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id integer PRIMARY KEY,
  name varchar(32),
  slogan varchar(255),
  description text,
  category varchar(64),
  default_price text
);

-- ---
-- Table 'Features'
--
-- ---

-- /features.csv
-- id
-- product_id
-- feature
-- value

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id integer PRIMARY KEY,
  product_id integer,
  feature varchar(32),
  value varchar(32)
);

-- ---
-- Table 'Styles'
--
-- ---

-- /styles.csv
-- id
-- productId
-- name
-- sale_price
-- original_price
-- default_style

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
  id integer PRIMARY KEY,
  productId integer,
  name varchar(32),
  sale_price varchar(32),
  original_price varchar(32),
  default_style boolean
);

-- ---
-- Table 'Photos'
--
-- ---

-- /photos.csv
-- id
-- styleId
-- url
-- thumbnail_url

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id integer PRIMARY KEY,
  styleId integer,
  url text,
  thumbnail_url text
);

-- ---
-- Table 'Skus'
--
-- ---

-- /skus.csv
-- id
-- styleId
-- size
-- quantity

DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id integer PRIMARY KEY,
  styleId integer,
  size varchar(12),
  quantity integer
);