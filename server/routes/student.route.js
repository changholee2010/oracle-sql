// routes/employee.js
const express = require("express");
const getConnection = require("../db");

const router = express.Router();

router.get("/all_student", auth, adminOnly, async (req, res) => {
  const conn = await getConnection();
  const result = await conn.execute(`SELECT * FROM student`);
  res.json(result.rows);
});

module.exports = router;
