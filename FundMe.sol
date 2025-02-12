// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {
    /*
    Tasks:
    1 - Get funds from users
    2 - Withdraw funds
    3 - Set a minimum funding value un USD
    */

    function fund() public payable {
        // Allowed users to send $
        // Have a minimum $ sent
        //// 1 - How do we send ETH to this contract
        require(msg.value > 1e18, "You can't send less than 1 Ether");
    }
}
