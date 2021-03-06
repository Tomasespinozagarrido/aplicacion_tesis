const express  = require('express');

const app = express();

//middlewares

app.use(express.json());
app.use(express.urlencoded({extended: false}));//extended=false =datos simples

//routes
app.use(require('./routes/index'));

app.listen(4000);
console.log('server on port 4000');