const getConnection = require("./db");

async function test() {
  const conn = await getConnection();
  const result = await conn.execute(
    `insert into board (board_no,title,writer,content) values(20,'title','user99','content')`,
  );
  console.log(result);
}
test();
