// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract Transfer {
    function transferERC20(IERC20 token, address to, uint256 amount) public {
        bool success = token.transfer(to, amount);
        require(success, "ERC20 transfer failed");
    }
}
