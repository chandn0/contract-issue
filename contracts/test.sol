// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IToken.sol";
import "./IUSC.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./Mintable.sol";

/// @title USC token contract
contract USC is IUSC, ERC20Burnable, Mintable {
constructor() ERC20("USC", "USC") {
// console.log("Uso");
}

/// @notice Returns name of token
function name() public view override(IToken, ERC20) returns (string memory) {
return super.name();
}

/// @notice Returns symbol of token
function symbol() public view override(IToken, ERC20) returns (string memory) {
return super.symbol();
}

/// @notice Returns decimals of token
function decimals() public view override(IToken, ERC20) returns (uint8) {
return super.decimals();
}

/// @notice Mints given amount of USC to given account
/// @param account Account to mint USC to
/// @param amount Amount of USC to mint
/// @custom:usage This function should be called from Arbitrage contract in purpose of minting USC
function mint(address account, uint256 amount) external onlyMinter {
_mint(account, amount);
}

/// @notice Burns given amount from caller
/// @param amount Amount of USC to burn
/// @custom:usage This function should be called from Arbitrage contract in purpose of burning USC
function burn(uint256 amount) public override(IToken, ERC20Burnable) onlyMinter {
super.burn(amount);
}
}