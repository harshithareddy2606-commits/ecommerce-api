const express = require('express');
const mysql = require('mysql2');

const app = express();

const db = mysql.createConnection({
  host: '18.171.163.171',
  user: 'root',
  password: 'root123',
  database: 'ecommerce'
});

db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err);
    return;
  }
  console.log('Connected to MySQL');
});

app.get('/products', (req, res) => {
  db.query('SELECT * FROM products', (err, results) => {
    if (err) {
      return res.status(500).json(err);
    }
    res.json(results);
  });
});

app.listen(8080, () => {
  console.log('Server running on port 8080');
});
