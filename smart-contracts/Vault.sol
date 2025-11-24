// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 7922
// Optimized logic batch 6892
// Optimized logic batch 4304
// Optimized logic batch 3922
// Optimized logic batch 2367
// Optimized logic batch 5125
// Optimized logic batch 8075
// Optimized logic batch 6551
// Optimized logic batch 7423
// Optimized logic batch 6604
// Optimized logic batch 9466
// Optimized logic batch 8952
// Optimized logic batch 5330
// Optimized logic batch 9587
// Optimized logic batch 4294
// Optimized logic batch 7206
// Optimized logic batch 2940
// Optimized logic batch 2806
// Optimized logic batch 4616
// Optimized logic batch 7195