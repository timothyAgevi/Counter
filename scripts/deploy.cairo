// Script to deploy the Balance contract to Starknet

use starknet::contract_address::compute_contract_address;
use starknet::deploy::deploy_syscall;
use starknet::ContractClass;
use starknet::Felt252;

fn main() {
    // Path to the compiled contract (replace with actual path if needed)
    let contract_class = ContractClass::from_path("target/dev/starknet_counter_contract_Balance.contract_class.json");

    // Constructor calldata (empty, as our constructor takes no arguments)
    let calldata: Array<Felt252> = ArrayTrait::new();

    // Compute a random salt for deployment
    let salt = 0x12345; // You can randomize this if needed

    // Deploy the contract
    let (contract_address, _) = deploy_syscall(
        class_hash=contract_class.class_hash(),
        contract_address_salt=salt,
        constructor_calldata=calldata.span(),
        deploy_from_zero=false
    );
     // Print the deployed contract address
    starknet::syscalls::debug_print("Deployed contract address:");
    starknet::syscalls::debug_print(contract_address);
}