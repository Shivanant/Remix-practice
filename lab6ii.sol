// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol";
import "../contracts/lab6.sol";

contract VoterListTestSuite {
    VoterList voterList;

    function beforeEach() public {
        voterList = new VoterList();
    }

    function checkManagerIsContractCreator() public {
        Assert.equal(voterList.manager(), address(this), "Manager should be contract creator");
    }

    function testAddVoterByManager() public {
        address voter = address(0x123);
        voterList.addVoter(voter);
    }

    function testAddVoterByNonManager() public {
        address nonManager = address(0x456);
        address voter = address(0x123);
        VoterList maliciousContract = new VoterList();
        maliciousContract.addVoter(voter);
    }
}

contract VoterListAnotherTestSuite {
    VoterList voterList;

    function beforeEach() public {
        voterList = new VoterList();
    }

    function testAddMultipleVoters() public {
        address voter1 = address(0x123);
        address voter2 = address(0x456);

        voterList.addVoter(voter1);
        voterList.addVoter(voter2);

    }
}
