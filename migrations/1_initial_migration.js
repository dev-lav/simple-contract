const Party = artifacts.require("Party");

module.exports = function (deployer) {
  deployer.deploy(Party);
};
