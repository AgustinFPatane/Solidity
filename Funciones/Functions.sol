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

    function par_impar(int _a) public pure returns(bool){
        return _a%2==0;
    }

    function division(uint _a, uint _b) public pure returns(uint,uint,bool){
        uint cociente = _a / _b;
        uint resto = _a % _b;
        bool multiplo = (_a % _b == 0);
        return (cociente,resto,multiplo);
    }
}