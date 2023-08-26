//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract funciones_globales{

    function MsgSender() public view returns (address){
        return msg.sender;
    }
    
    function Now() public view returns (uint){
        return now;
    }

    function BlockCoinbase() public view returns (address){
        return block.coinbase;
    }

    function BlockDifficulty() public view returns (uint){
        return block.difficulty;
    }


}

contract hash{

    function calcular_hash(string memory _cadena) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_cadena));
    }
    
    function calcular_hash(string memory _cadena, uint _k, address _direccion) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_cadena, _k, _direccion));
    }
}

//<tipo de dato> <nombre variable>;
//<tipo de dato> <nombre variable> = <valor>;