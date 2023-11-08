// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IMintable} from "./IMintable.sol";

interface IToken is IMintable, IERC20 {
function name() external view returns (string memory);

function symbol() external view returns (string memory);

function decimals() external view returns (uint8);

function mint(address, uint256) external;

function burn(uint256) external;
}