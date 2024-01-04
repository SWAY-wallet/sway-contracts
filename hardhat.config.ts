import '@nomicfoundation/hardhat-foundry';
import '@nomicfoundation/hardhat-toolbox';
import * as dotenv from 'dotenv';
import { HardhatUserConfig } from 'hardhat/config';

dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: '0.8.19',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  networks: {
    hardhat: {},
    gobiTestnet: {
      url: process.env.GOBI_TESTNET_URL || '',
      accounts: [
        process.env.PRIVATE_KEY as string,
        process.env.ALICE_PRIVATE_KEY as string,
        process.env.BOB_PRIVATE_KEY as string,
        process.env.GUARDIAN1_PRIVATE_KEY as string,
        process.env.GUARDIAN2_PRIVATE_KEY as string,
        process.env.GUARDIAN3_PRIVATE_KEY as string,
      ],
      gasPrice: 'auto',
    },
  },
};

export default config;
