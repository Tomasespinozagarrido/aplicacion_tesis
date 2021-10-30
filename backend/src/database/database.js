const { Sequalize } =require ('sequelize');

export const sequalize = new Sequalize(
    'app_tesis',
    'postgres',
    'admin',
    {
        host: 'localhost',
        dialect: 'postgres',
        pool:{
            max:5,
            min:0,
            require: 3000,
            idle: 10000
        },
        logging: false
    }
);