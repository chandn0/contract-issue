/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const fs = require("fs");
const path = require("path");
const BASE_URL = "dev.buildbear.io";
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");
require("@nomicfoundation/hardhat-chai-matchers");

let bbNode;
try {
  bbNode = JSON.parse(
    fs.readFileSync(path.join(__dirname, "./testnet.json")).toString().trim()
  );
} catch {}

module.exports = {
  defaultNetwork: bbNode ? "buildbear" : "localhost",

  networks: {
    hardhat: {},
    buildbear: {
      url: bbNode.nodeId ? `https://rpc.${BASE_URL}/${bbNode.nodeId}` : "",
    },
  },
  solidity: {
    compilers: [
      {
        version: "0.8.16",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.8.4",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.8.9",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.5.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.8.13",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.5.5",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  etherscan: {
    apiKey: {
      buildbear: "verifyContract",
    },
    customChains: [
      {
        network: "buildbear",
        chainId: bbNode ? bbNode.chainId : 0,
        urls: {
          apiURL: `https://rpc.${BASE_URL}/verify/etherscan/${bbNode.nodeId}`,
          browserURL: `https://explorer.${BASE_URL}/${bbNode.nodeId}`,
        },
      },
    ],
  },
  paths: {
    sources: "./contracts",
    cache: "./cache",
    artifacts: "./artifacts",
  },
  mocha: {
    timeout: 20000000000,
  },
};
