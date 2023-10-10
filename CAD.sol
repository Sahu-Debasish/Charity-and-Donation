// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityDonation {
    address public charity;
    address public donor;
    uint public donationAmount;
    uint public donationGoal;
    bool public campaignEnded;
    mapping(address => uint) public donations;

    event DonationMade(address indexed donor, uint amount);
    event FundsReleased(uint amount);

    constructor(address _charity, uint _goal) {
        charity = _charity;
        donationGoal = _goal;
    }

    function donate() external payable {
        require(!campaignEnded, "Campaign has ended.");
        require(msg.sender != charity, "Charity cannot donate to itself.");
        require(msg.value > 0, "Donation amount must be greater than zero.");

        uint amount = msg.value;
        donations[msg.sender] += amount;
        donationAmount += amount;
        emit DonationMade(msg.sender, amount);

        if (donationAmount >= donationGoal) {
            campaignEnded = true;
            emit FundsReleased(donationAmount);
            payable(charity).transfer(donationAmount);
        }
    }

    function getRefund() external {
        require(campaignEnded && donationAmount < donationGoal, "Campaign is not over or goal is met.");
        uint amount = donations[msg.sender];
        require(amount > 0, "You have no funds to refund.");

        donations[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    function withdrawFunds() external {
        require(campaignEnded && donationAmount >= donationGoal, "Campaign is not over or goal is not met.");
        require(msg.sender == charity, "Only the charity can withdraw funds.");

        emit FundsReleased(donationAmount);
        payable(charity).transfer(donationAmount);
    }
}
