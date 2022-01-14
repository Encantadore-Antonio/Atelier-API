const postgres = require('postgres');

const sql = postgres({
  host: 'localhost',
  port: 5432,
  username: 'ginwoopak',
  password: '',
  database: 'products',
  onnotice: console.log
});

module.exports = {sql};