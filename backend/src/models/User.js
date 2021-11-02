'use strict';
const {Sequalize} = require('sequalize');
const {sequalize} = require('../database/database');


const User = sequalize.define('User',{
    id:{
        type: Sequalize.INTEGER,
        primaryKey: true
    },
    nombre:{
        type: Sequalize.STRING
    },
    email:{
        type: Sequalize.STRING
    }
})

export default User;
/*const userSchema = new Schema({
    id : Number,
    nombre: String,
    email: String

});
module.exports = (sequealize,Datatypes)=>{
    class User extends Model {
        static associate(models){

        }
    };
    User.unit({
        id: Datatypes.Number,
        nombre: Datatypes.String,
        email: Datatypes.String
    },{
        sequealize,
        modelName: 'User',
    });
    return User;
};*/