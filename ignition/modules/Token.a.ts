import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const TokenAModule = buildModule("TokenAModule", (m) => {
  const tokena = m.contract("TokenA");

  return { tokena };
});

export default TokenAModule;
