---CREATE DATABASE app_tesis;
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(40),
    email TEXT
);

INSERT INTO users (nombre, email) VALUES 
    ('Tomas Espinoza','tomas.espinoza@alu.ucm.cl'),
    ('Gonzalo Jaques','gonzalo.jaques@alu.ucm.cl');