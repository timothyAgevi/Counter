#[starknet::interface]
trait IBalance<T> {
    // Returns the current count.
    fn get(self: @T) -> u64;
    // Increases the count by one.
    fn increment(ref self: T);
    // Decreases the count by one.
    fn decrement(ref self: T);
}

#[starknet::contract]
mod Balance {
    use traits::Into;

    #[storage]
    struct Storage {
        count: u64,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.count.write(0_u64);
    }

    #[external(v0)]
    impl Balance of super::IBalance<ContractState> {
        fn get(self: @ContractState) -> u64 {
            self.count.read()
        }
        fn increment(ref self: ContractState) {
            self.count.write(self.count.read() + 1);
        }
        fn decrement(ref self: ContractState) {
            self.count.write(self.count.read() - 1);
        }
    }
}
