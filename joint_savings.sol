pragma solidity ^0.5.0;

contract JointSavings{
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public jointSavingsBalance;

    function withdraw(uint amount, address payable recipient) public {
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(amount <= jointSavingsBalance, "Insufficient funds!");

        if(lastToWithdraw != recipient) {
            lastToWithdraw = recipient;

        }

        recipient.transfer(amount);
        lastWithdrawAmount = amount;
        jointSavingsBalance = address(this).balance;
    }

    function deposit() public payable {
        jointSavingsBalance = address(this).balance;
    }

    function setAccounts(address payable acct1, address payable acct2) public{
        accountOne = acct1;
        accountTwo = acct2;
    }

    function() external payable {}
}
