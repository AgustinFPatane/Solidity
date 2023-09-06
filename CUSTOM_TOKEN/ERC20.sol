//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.9.0;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";

//Interface of the ERC20 token 
interface IERC20 {
    //Returns the amount of existing tokens
    function totalSupply() external view returns(uint256);

    //Returns the amount of existing tokens for a given address
    function balanceOf(address _account) external view returns(uint256);

    //Returns the number of tokens the spender can spend on behalf of the owner
    function allowance(address _owner, address _spender) external view returns(uint256);

    //Returns a boolean result of the indicated operation
    function transfer(address _recipient, uint _amount) external returns(bool);

    //Returns a boolean result of the spend operation
    function approve(address _spender, uint _amount) external returns(bool); 

    //Returns a boolean result of the operation to pass a number of tokens using the allowance() method
    function transferFrom(address _sender, address _recipient, uint256 _amount) external returns(bool);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _from, address indexed _spender, uint _value);

}


contract ERC20Basic is IERC20{
    using SafeMath for uint256;
    event Transfer(address indexed _from, address indexed _to, uint256 _tokens);
    event Approval(address indexed _from, address indexed _spender, uint _tokens);




    function totalSupply() public view override returns(uint256){
        
    }

    function balanceOf(address _account) public view override returns(uint256){

    }

    function allowance(address _owner, address _spender) public view override returns(uint256){

    }

    function transfer(address _recipient, uint _amount) public override returns(bool) {

    }

    function approve(address _spender, uint _amount) public override returns(bool){

    }

    function transferFrom(address _sender, address _recipient, uint256 _amount) external override returns(bool){

    }
}


