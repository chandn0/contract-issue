// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IMintable {
error ZeroAddress();
error NotMinter(address _caller);

event UpdateMinter(address indexed _account, bool indexed _status);

function isMinter(address) external view returns (bool);

function updateMinter(address, bool) external;
}