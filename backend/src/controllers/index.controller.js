const{ Pool } = require('pg');
const { Sequalize } =require ('sequelize');


const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password:'admin',
    database:'app_tesis',
    port: '5432'
})
//const User = require('../models/User');
const getUsers =async (req,res)=>{
    const response = await pool.query('SELECT * FROM users');
    //const user = await User.findAll();
    //res.json({ user })
    console.log(response.rows)
    res.status(200).json(response.rows);

};

const getUsersById =async (req,res)=>{
    const id = req.params.id;
    const response = await pool.query('SELECT * FROM users where id= $1',[id]);
    //const user = await User.findAll();
    res.json( response.rows);

    //res.status(200).json(response.rows);

};

const createUser = async(req, res) =>{
    const {nombre, email} = req.body;

    const response = await pool.query('INSERT INTO users (name, email) values($1,$2)',[nombre,email]);
    res. send('Usuario creado');
};

module.exports ={
    getUsers,
    createUser,
    getUsersById
}