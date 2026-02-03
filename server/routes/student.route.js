// routes/employee.js
const express = require("express");
const getConnection = require("../db");

const router = express.Router();

// http://localhost:3000/students/all =>
router.get("/all", async (req, res) => {
  const conn = await getConnection();
  const result = await conn.execute(`SELECT studno, name 
      ,tel
      ,substr(tel, 1, instr(tel, ')', 1) - 1) "AREACODE"
      ,substr(tel                     -- 문자열.
             ,instr(tel, ')', 1) + 1  -- 시작위치.
             ,instr(tel, '-', 1) - instr(tel, ')', 1) - 1 -- 크기.
             ) "1stNo"
FROM student s`);
  res.json(result.rows);
});

// http://localhost:3000/students/emp =>
router.get("/emp", async (req, res) => {
  const conn = await getConnection();
  const result = await conn.execute(`SELECT * FROM emp`);
  res.json(result.rows);
});

module.exports = router;
