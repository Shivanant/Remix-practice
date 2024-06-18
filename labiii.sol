// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainTracking {
    // Enum for step statuses
    enum StepStatus { Created, InProgress, Completed }

    // Struct for each step in the supply chain
    struct Step {
        string participant;
        string description;
        StepStatus status;
    }

    // Array to store the history of all steps in the supply chain
    Step[] private supplyChainHistory;

    // Event declarations for logging activities
    event NewStepAdded(uint stepIndex, string participant, string description);
    event StepStatusUpdated(uint stepIndex, StepStatus status);

    // Modifier to check if a step exists
    modifier stepExists(uint _stepIndex) {
        require(_stepIndex < supplyChainHistory.length, "Step does not exist.");
        _;
    }

    // Function to add a new step to the supply chain
    function addNewStep(string memory _participant, string memory _description) public {
        supplyChainHistory.push(Step(_participant, _description, StepStatus.Created));
        emit NewStepAdded(supplyChainHistory.length - 1, _participant, _description);
    }

    // Function to update the status of an existing step
    function updateStepStatus(uint _stepIndex, StepStatus _status) public stepExists(_stepIndex) {
        supplyChainHistory[_stepIndex].status = _status;
        emit StepStatusUpdated(_stepIndex, _status);
    }

    // Function to get the full supply chain history
    function getSupplyChainHistory() public view returns (string[] memory, string[] memory, StepStatus[] memory) {
        uint length = supplyChainHistory.length;
        
        // Initialize arrays to hold the supply chain history
        string[] memory participants = new string[](length);
        string[] memory descriptions = new string[](length);
        StepStatus[] memory statuses = new StepStatus[](length);

        for(uint i = 0; i < length; i++) {
            Step storage step = supplyChainHistory[i];
            participants[i] = step.participant;
            descriptions[i] = step.description;
            statuses[i] = step.status;
        }

        return (participants, descriptions, statuses);
    }
}
