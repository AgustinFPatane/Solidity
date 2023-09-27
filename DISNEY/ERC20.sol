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

    string public constant name = "GUGUICOIN";
    string public constant symbol = "GC";
    uint8 public constant decimals = 2;

    mapping (address => uint) balances; //amount of tokens of each address
    mapping (address => mapping (address => uint)) allowed;
    uint256 _totalSupply; //amount of tokens

    using SafeMath for uint256;
    event Transfer(address indexed _from, address indexed _to, uint256 _tokens);
    event Approval(address indexed _from, address indexed _spender, uint _tokens);

    constructor (uint initialAmount) public{
        _totalSupply = initialAmount;
        balances[msg.sender] = initialAmount; //assign all tokens to the contract owner
    }

    function totalSupply() public view override returns(uint256){
        return _totalSupply;
    }

    function increaseTotalSupply (uint _newTokensAmount) public {
        _totalSupply = _totalSupply.add(_newTokensAmount);
        balances[msg.sender] = balances[msg.sender].add(_newTokensAmount);
    }

    function balanceOf(address _tokenOwner) public view override returns(uint256){
        return balances[_tokenOwner];
    }

    function allowance(address _owner, address _delegate) public view override returns(uint256){
        return allowed[_owner][_delegate];
    }

    function transfer(address _recipient, uint _amount) public override returns(bool) {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_recipient] = balances[_recipient].add(_amount);
        emit Transfer(msg.sender,_recipient,_amount);
        return true;
    }

    function approve(address _delegate, uint256 _amount) public override returns(bool){
        allowed[msg.sender][_delegate] = _amount;
        emit Approval(msg.sender, _delegate, _amount);
        return true;
    }

    function transferFrom(address _owner, address _buyer, uint256 _amount) external override returns(bool){
        require(balances[_owner] >= _amount);
        require(allowed[_owner][msg.sender] >= _amount);

        balances[_owner] = balances[_owner].sub(_amount);
        allowed[_owner][msg.sender] = allowed[_owner][msg.sender].sub(_amount);
        balances[_buyer] = balances[_buyer].add(_amount);
        emit Transfer(_owner,_buyer,_amount);
        return true;
    }
}


