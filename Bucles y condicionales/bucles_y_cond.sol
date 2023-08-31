//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.7.0;

contract condicionales{

    function truefalse(bool _value) public pure returns(string memory){
        string memory mensaje;
        if(_value){
            mensaje = "es verdadero";
        } else {
            mensaje = "es falso";
        }
        return mensaje;
    }

}