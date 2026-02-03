const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
// 라우팅(http://localhost:3000/students) -> 실행코드.
app.use("/students", require("./routes/student.route.js"));
const port = 3000;

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
