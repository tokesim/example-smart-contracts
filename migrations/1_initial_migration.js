const Migrations = artifacts.require("Migrations");
const SimpleToken = artifacts.require("SimpleToken");

module.exports = function(deployer) {
  deployer.deploy(SimpleToken, "GOLD", "GLD");
};
