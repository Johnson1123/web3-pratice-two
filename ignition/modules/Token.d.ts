import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const TokenDModule = buildModule("TokenDModule", (m) => {
  const tokend = m.contract("TokenD");

  return { tokend };
});

export default TokenDModule;