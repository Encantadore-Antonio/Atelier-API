const express = require('express');
const bodyParser = require('body-parser');
const { sql } = require('../database/index.js');

const port = 3000;
const app = express();

app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/products', (req, res) => {
  async function getAllProducts() {
    try {
      const products =
        await sql`SELECT * FROM product LIMIT ${req.query.count}`;
      res.send(products);
    } catch (err) {
      console.log(err);
    }
  }
  getAllProducts();
});

app.get('/skus', (req, res) => {
  async function getSkus() {
    try {
      const skus = await sql`
      SELECT
        json_agg(
          json_build_object(
            'id', skus.id,
            'styleid', skus.styleid,
            'size', skus.size,
            'quantity', skus.quantity
          )
        ) as skus
      FROM skus
      GROUP BY skus.styleid
      LIMIT 20
      `;
      // const skus = await sql`
      //   SELECT * FROM skus LIMIT 20
      //   `;
      res.send(skus);
    } catch (err) {
      console.log(err);
    }
  }
  getSkus();
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
      `;
      res.send(features[0]);
    } catch (err) {
      console.log(err);
    }
  }
  getFeatures();
});

app.get('/products/:product_id/styles', (req, res) => {
  async function getStyles() {
    try {
      const styles = await sql`
      SELECT
        TO_CHAR(features.product_id, 'FM999MI') product_id,
        jsonb_agg(
          DISTINCT jsonb_build_object(
            'style_id', styles.id,
            'name', styles.name,
            'original_price', styles.original_price,
            'sale_price', REPLACE(styles.sale_price, 'null', '0'),
            'default?', styles.default_style
          )
        ) as results
      FROM features
      LEFT JOIN styles ON styles.productId = features.product_id
      WHERE features.product_id = ${req.params.product_id}
      GROUP BY features.product_id
      `;
      return styles;
    } catch (err) {
      console.log(err);
    }
  }

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
    } catch (err) {
      console.log(err);
    }
  }

  async function getSkus() {
    try {
      const skus = await sql`
      SELECT
        json_agg(
          json_build_object(
            'id', skus.id,
            'size', skus.size,
            'quantity', skus.quantity
          )
        ) as skus
      FROM skus
      GROUP BY skus.styleid
      LIMIT 20
      `;
      return skus;
    } catch (err) {
      console.log(err);
    }
  }

  getStyles()
    .then((styles) => {
      styles[0].results.sort(
        (a, b) => parseFloat(a.style_id) - parseFloat(b.style_id)
      );
      return styles[0];
    })
    .then((sortedStyles) => {
      getPhotos()
        .then((photos) => {
          for (let i = 0; i < sortedStyles.results.length; i++) {
            sortedStyles.results[i]['photos'] = photos[i].photos
          }
        })
        .then(() => {
          getSkus()
            .then((skus) => {
              for (let j = 0; j < sortedStyles.results.length; j++) {
                sortedStyles.results[j]['skus'] = {}
                for (let k = 0; k < skus[j].skus.length; k++) {
                    sortedStyles.results[j]['skus'][skus[j].skus[k].id] = skus[j].skus[k]
                 }
            }
              res.send(sortedStyles)
            })
        })
    })
});

app.listen(port, function () {
  console.log(`listening on port ${port}`);
});
