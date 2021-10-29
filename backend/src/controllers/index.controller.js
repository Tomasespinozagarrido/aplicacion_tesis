const{ Pool } = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password:'admin',
    database:'app_tesis',
    port: '5432'
})

const getUsers =async (req,res)=>{
    const response = await pool.query('SELECT * FROM users');
    res.status(200).json(response.rows);

};
const createUser = async(req, res) =>{
    const {nombre, email} = req.body;

    const response = await pool.query('INSERT INTO users (name, email) values($1,$2)',[nombre,email]);
    res. send('Usuario creado');
};

module.exports ={
    getUsers,
    createUser
}