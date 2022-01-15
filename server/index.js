const express = require('express');
const bodyParser = require('body-parser');
const {sql} = require('../database/index.js');

const port = 3000;
const app = express();

app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));

app.get('/products', (req, res) => {
  async function getAllProducts() {
    try {
      const products = await sql`SELECT * FROM product LIMIT ${req.query.count}`;
      res.send(products);
    } catch(err) {
      console.log(err)
    }
  }
  getAllProducts()
});

app.get('/photos', (req, res) => {
  async function getPhotos() {
    try {
      const photos = await sql`
      SELECT
        json_agg(json_build_object(
          'url', photos.url,
          'thumbnail_url', photos.thumbnail_url
        )) as photos
      FROM photos
      GROUP BY photos.styleid
      LIMIT 20
      `;
      res.send(photos);
    } catch(err) {
      console.log(err)
    }
  }
  getPhotos()
});

app.get('/products/:product_id', (req, res) => {
  async function getFeatures() {
    try {
      const features = await sql`
      SELECT product.*, json_agg(json_build_object('feature', features.feature, 'value', features.value)) as features
      FROM product
      LEFT JOIN features ON features.product_id = product.id
      WHERE product.id = ${req.params.product_id}
      GROUP BY product.id
      `
      res.send(features);
    } catch(err) {
      console.log(err);
    }
  }
  getFeatures()
});

app.get('/products/:product_id/styles', (req, res) => {
  async function getPhotos() {
    try {
      const photos = await sql`
      SELECT
        json_agg(json_build_object(
          'url', photos.url,
          'thumbnail_url', photos.thumbnail_url
        )) as photos
      FROM photos
      GROUP BY photos.styleid
      LIMIT 20
      `;
      return photos;
    } catch(err) {
      console.log(err)
    }
  }

  async function getStyles() {
    try {
      const styles = await sql`
      SELECT
        features.product_id,
        jsonb_agg(
          DISTINCT jsonb_build_object(
            'style_id', styles.id,
            'name', styles.name,
            'original_price', styles.original_price,
            'sale_price', styles.sale_price,
            'default?', styles.default_style
          )
        ) as results
      FROM features
      LEFT JOIN styles ON styles.productId = features.product_id
      WHERE features.product_id = ${req.params.product_id}
      GROUP BY features.product_id
      `
      console.log(styles.results)
      return styles;
    } catch(err) {
      console.log(err);
    }
  }

  getPhotos()
  .then((photos) => {
    getStyles()
    .then((data) => {
      console.log(data[0].results)
      res.send(data[0].results)
    })
  })
});


app.listen(port, function () {
  console.log(`listening on port ${port}`);
});
