//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract funciones{

    address[] public direcciones;

    function nuevaDireccion() public{
        direcciones.push(msg.sender);
    }

    bytes32 public myHash;
    function hash(string memory _dato) public{
        myHash = keccak256(abi.encodePacked(_dato));
    }

}