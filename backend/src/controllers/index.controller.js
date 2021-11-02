const{ Pool } = require('pg');
const { Sequalize } =require ('sequelize');

const {usernameDB, passwordDB,hostDB,databaseDB} = require('../database/database');
 

const pool = new Pool({
    host: hostDB,
    user: usernameDB,
    password:passwordDB,
    database:databaseDB,
    port: '5432'
})
//const User = require('../models/User');
const getUsers =async (req,res)=>{
    const response = await pool.query('SELECT * FROM users');
    //const user = await User.findAll();
    //res.json({ user })
    //console.log(response.rows)
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
    //console.log(req.body);
    const response = await pool.query('INSERT INTO users (nombre, email) values($1,$2)',[nombre,email]);
    res. send('Usuario creado');
};

const updateUser = async(req, res) =>{
    const id = req.params.id;
    const {nombre,email} =req.body;
    const response = await pool.query('UPDATE users SET nombre = $1, email= $2 WHERE id=$3',[nombre,email,id]);
    res.send('User actualizado correctamente');
};
const deleteUser = async(req, res)=>{
    const id = req.params.id;
    const response = await pool.query('DELETE FROM users where id= $1',[id]);
    console.log(response);
    res.send('User eliminado satisfactoriamente.')
};


module.exports ={
    getUsers,
    createUser,
    updateUser,
    getUsersById,
    deleteUser
}