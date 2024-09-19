import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const TokenBModule = buildModule("TokenBModule", (m) => {
  const tokenb = m.contract("TokenA");

  return { tokenb };
});

export default TokenBModule;