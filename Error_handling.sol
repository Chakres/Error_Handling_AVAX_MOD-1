// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract errorHandlingn {

    mapping(string => bool) public purchased;
    int public totalSold;

    function Buy(string memory customer ,uint _age) external {
        ageVerify(_age);

        require(!purchased[customer], "You have already bought");

        totalSold += 1;
        purchased[customer] = true;

        assert(totalSold > 0);
    }

    function ageVerify(uint _age) public pure {
        if(_age < 21) {
            revert("Not Eligible");
        }
    }
}
