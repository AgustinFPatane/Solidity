//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.9.0;
pragma experimental ABIEncoderV2;
import "./ERC20.sol";

contract Disney {

    ERC20Basic private token;
    address payable public owner;

    struct cliente {
        uint tokens_comprados;
        string[] atracciones_disfrutadas;
    }

    constructor () public{
        token = new ERC20Basic(10000);
        owner = msg.sender;
    }
    
    mapping(address => cliente) public Clientes;



    

}