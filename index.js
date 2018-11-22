const express = require('express');
const exec = require('child_process').exec;
const app = express();

const version = 'v6';

app.get('*', (req, res) => {
  res.send(JSON.stringify(process.env, null, '\t'));
});

app.listen(8000, () => console.log(`servicea@${version} listening on port 8000`));
