# Newspaper Vending Machine FSM

## Description

A coin-operated electronic newspaper vending machine designed using a Finite State Machine (FSM) and implemented in Verilog HDL.

The newspaper costs 15 cents.

## Accepted Coins

- Nickel (N) = 5 cents
- Dime (D) = 10 cents

## Valid Combinations

The machine recognizes:

- Nickel + Dime = 15 cents
- Dime + Nickel = 15 cents
- Nickel + Nickel + Nickel = 15 cents
- Dime + Dime = 20 cents

For the 20-cent case, no change is returned as specified in the problem.

## FSM States

| State | Description |
|---|---|
| S0 | 0 cents |
| S5 | 5 cents |
| S10 | 10 cents |
| S15 | 15 cents / vend |
| S20 | 20 cents / vend |

## Files

- `newspaper_vending.v` — FSM implementation
- `tb_newspaper_vending.v` — Verilog testbench

## Tools

- Vivado
- Verilog HDL
- Behavioral simulation

## Verification

The testbench verifies the following sequences:

1. N → D
2. D → N
3. N → N → N
4. D → D

The `vend` output is asserted when the required amount has been deposited.
