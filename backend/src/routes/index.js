const {Router} = require('express');
const router = Router();

const {getUsers, createUser, getUsersById } = require('../controllers/index.controller')

router.get('/users',getUsers);
router.get('/users/:id',getUsersById);
router.post('/users',createUser);

module.exports = router;