// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract UStake {

    address public owner;
    IERC20 public StakedToken;
    IERC20 public RewardToken;
    uint8 public rewardAPY;

    mapping(address => User) UserDetails;

    address[] public allStakers;

    error OnlyOwnerError(string _message);

    struct User {
        string name;
        uint AmountStaked;
        uint RewardAccrued;
        uint LastInteracted;
    }

    constructor(){
        owner = msg.sender;
    }

    function onlyOwner() internal view {
        if (msg.sender != owner) revert OnlyOwnerError("Only Owner can call this function");
    }

     function setStakeToken(address _stakeToken) public {
        onlyOwner();
        StakedToken = IERC20(_stakeToken);
     }

     function setRewardToken(address _rewardToken) public {
        onlyOwner();
        RewardToken = IERC20(_rewardToken);
     }

    //  function getAllStakers() public returns (address[] memory){
    //     return allStakers;
    //  }

     function stake(string calldata _name, uint _amount) public {
        User memory _user = UserDetails[msg.sender];
        _user.name = _name;
        _user.AmountStaked += _amount;
        _user.LastInteracted = block.timestamp;
        UserDetails[msg.sender] = _user;
     }

     function withdrawStake(uint256 _amount) public {
        User memory _user = UserDetails[msg.sender];
        if (_amount > _user.AmountStaked) revert ("You cant withdraw more than you have staked");
        _user.AmountStaked -= _amount;
        uint256 _reward = calcReward();
        _user.RewardAccrued = _reward;
        _user.LastInteracted = block.timestamp;
        UserDetails[msg.sender] = _user;
        StakedToken.transfer(msg.sender, _amount);
     }

     function withdrawReward() {
        
     }

     function withdrawAll() {
        
     }


     function setRewardAPY(uint8 _rewardAPY) public returns (uint8 _rewardAPY){
        onlyOwner();
        rewardAPY = _rewardAPY;
     }

     function getRewardAPY() public returns (uint8 _rewardAPY){
        uint _rewardAPY = rewardAPY;
     }

     function calcReward() internal returns(uint256 _reward){
        User memory _user = UserDetails[msg.sender];
        uint timeRange = block.timestamp - _user.LastInteracted;
        uint _rewardAPY = getRewardAPY();
        _reward = (timeRange * _rewardAPY * _user.AmountStaked)/(SEC_PER_YEAR * 100);
        _user.LastInteracted = block.timestamp;
        UserDetails[msg.sender] = _user;
     }

}
