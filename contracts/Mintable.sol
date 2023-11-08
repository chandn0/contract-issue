// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IMintable.sol";

/// @title Mintable
/// @notice CHI and USC tokens should inherit from this contract
contract Mintable is IMintable, Ownable {
mapping(address => bool) public isMinter;

modifier onlyMinter() {
if (!isMinter[msg.sender]) {
revert NotMinter(msg.sender);
}
_;
}

/// @notice Grants/revokes minter role
/// @param account Address to grant/revoke minter role
/// @param status True to grant, false to revoke
function updateMinter(address account, bool status) external onlyOwner {
if (account == address(0)) {
revert ZeroAddress();
}
isMinter[account] = status;
emit UpdateMinter(account, status);
}
}