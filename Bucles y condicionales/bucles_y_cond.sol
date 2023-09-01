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

interface MyInterface {
    function myFunction(uint256 _param, uint256 _param2) external returns (bool);
    function anotherFunction(string memory input) external view returns (uint256);
}

contract MyContract is MyInterface {
    // Implementar las funciones de MyInterface aquí
    function myFunction(uint256 _param, uint256 _param2) external override returns (bool) {
        // Implementación de la función myFunction
        return _param == _param2;
    }

    function anotherFunction(string memory input) external view override returns (uint256) {
        // Implementación de la función anotherFunction
        return bytes(input).length;
    }
}
