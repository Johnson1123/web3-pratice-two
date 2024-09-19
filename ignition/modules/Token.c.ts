import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const TokenCModule = buildModule("TokenCModule", (m) => {
  const tokenc = m.contract("TokenC");

  return { tokenc };
});

export default TokenCModule;