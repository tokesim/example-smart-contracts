pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract SimpleToken is ERC20Burnable {
    constructor(string memory name, string memory symbol) public ERC20(name, symbol) {

    }

    function pay() public payable {
        uint256 cost = SafeMath.mul(totalSupply(),10000);
        require(msg.value >= cost, "Not enough money");
        uint256 refund = msg.value - cost;
        _mint(msg.sender, 1);
        if(refund > 0) {
            msg.sender.transfer(refund);
        }
    }
    function rate() public returns(uint256) {
        return SafeMath.mul(totalSupply(),10000);
    }
    function exchange(uint256 tokens) public {
        uint256 total = SafeMath.sub(totalSupply(),tokens, "Not enough token supply");
        uint256 cost = 1;
        if( total != 0){
            cost = SafeMath.div(total, 10000);
        }
        burn(tokens);
        msg.sender.transfer(cost);
    }
}