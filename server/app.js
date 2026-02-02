const express = require("express");
app.use("/students", require("./routes/student.route"));

const app = express();
const port = 3000;

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
