// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Query {
    event TransferOccurred(address indexed from, uint256 amount);

    function checkCall(bytes calldata data) external {
        // ERC20トランスファー関数のセレクタは "a9059cbb"
        bytes4 selector;
        assembly {
            // calldataから最初の4バイト（関数セレクタ）を読み取る
            selector := calldataload(data.offset)
        }
        require(selector == 0xa9059cbb, "Not an ERC20 transfer function");

        // `data`からアドレスと金額を抽出
        (, address to, uint256 amount) = abi.decode(data[4:], (address, uint256));

        emit TransferOccurred(to, amount);
    }
}
