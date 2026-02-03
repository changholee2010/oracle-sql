const oracledb = require("oracledb");

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

module.exports = async function getConnection() {
  return await oracledb.getConnection({
    user: "scott",
    password: "tiger",
    connectString: "192.168.0.9:1521/XE",
  });
};
