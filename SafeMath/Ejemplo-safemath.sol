// SPDX-License-Identifier: UNLICENCED
pragma solidity >=0.4.4 <0.7.0;
import "./SafeMath.sol";

contract ejemplo {

    using SafeMath for uint;

    function suma_segura(uint _a, uint _b) public pure returns(uint){
        return _a.add(_b);
    }

    function resta_segura(uint _a, uint _b) public pure returns(uint){
        return _a.sub(_b);
    }

}