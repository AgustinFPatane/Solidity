//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.7.0;
import "./ERC20.sol";

//Ejemplo tipico de un contrato con su constructor
contract mycontract {
    address owner;
    ERC20Basic token;
    constructor() public {
        owner = msg.sender;
        token = new ERC20Basic(1000);
    }
}


