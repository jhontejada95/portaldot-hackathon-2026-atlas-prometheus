# Contract proof candidate

`EvidenceAnchor.sol` is the minimal EVM/revive candidate for the Atlas proof
layer. It stores a commitment and review status while keeping the evidence
payload off-chain.

The contract is compiled with Solidity 0.8.24, optimizer enabled and `paris`
EVM semantics to avoid assuming newer opcodes. It is deployment-ready but not
claimed as deployed until a real Portal V3 receipt, final block, contract
address and explorer record are available.

The full contract matrix and ink! bundles remain in the source-of-record Atlas
repository. This submission snapshot keeps the reviewer-facing proof contract
small and auditable.
