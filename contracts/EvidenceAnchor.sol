// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @notice Minimal commitment registry for the Atlas EVM/revive deployment path.
/// Evidence payloads remain off-chain; only the commitment and review state are stored.
contract EvidenceAnchor {
    enum Status { Pending, Accepted, Rejected, Revoked }

    struct Record {
        address submitter;
        uint64 season;
        uint64 createdAt;
        Status status;
        bytes32 commitment;
    }

    address public immutable owner;
    mapping(bytes32 => Record) private records;

    event EvidenceAnchored(bytes32 indexed evidenceId, bytes32 indexed commitment, address indexed submitter, uint64 season);
    event EvidenceReviewed(bytes32 indexed evidenceId, Status status);

    error NotOwner();
    error AlreadyAnchored();
    error MissingEvidence();

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    constructor(address owner_) {
        owner = owner_ == address(0) ? msg.sender : owner_;
    }

    function anchor(bytes32 evidenceId, bytes32 commitment, uint64 season) external onlyOwner {
        if (records[evidenceId].createdAt != 0) revert AlreadyAnchored();
        records[evidenceId] = Record(msg.sender, season, uint64(block.timestamp), Status.Pending, commitment);
        emit EvidenceAnchored(evidenceId, commitment, msg.sender, season);
    }

    function review(bytes32 evidenceId, Status status) external onlyOwner {
        if (records[evidenceId].createdAt == 0) revert MissingEvidence();
        records[evidenceId].status = status;
        emit EvidenceReviewed(evidenceId, status);
    }

    function getRecord(bytes32 evidenceId) external view returns (Record memory) {
        return records[evidenceId];
    }
}
