# Off-Chain

## Installation

```bash
cd onchain
npm i
```

## Running the Script

```bash
npm start
```

### Sample Output

```bash
npm start

> start
> npx tsx src/index.ts

Price Feed Description USDT / ETH
Price Feed Decimals 18
roundId: 92233720368547761183
answer: 631935162963815
startedAt: 1744917706
updatedAt: 1744917731
answeredInRound: 92233720368547761183
Price USDT / ETH : 0.000631935162963815
Price of 1 ETH = 1582.440824007859

```

# On-Chain

# Installation

```
cd onchain
forge install
forge build
```

## Deploying and Running the Script

```bash
forge script script/FeedConsumer.s.sol --rpc-url buildbear --broadcast

```

## Sample Output

```bash
forge script script/FeedConsumer.s.sol --rpc-url buildbear --broadcast
[⠊] Compiling...
No files changed, compilation skipped
Script ran successfully.

== Logs ==
  Deployed FeedConsumer at: 0xfba38625bcfb7BBF420dDD163ac780530ad89d66
  Feed Description: USDT / ETH
  Feed Decimals: 18
  Formatted Price (scaled 18d): 631935162963815
  Unit Price (scaled 18d): 1582440824007858890448

## Setting up 1 EVM.

==========================

Chain 1

Estimated gas price: 0.554757554 gwei

Estimated total gas used for script: 1033107

Estimated amount required: 0.000573123912340278 ETH

==========================

##### mainnet
✅  [Success] Hash: 0x204b154204a338d780cd1ff65e6f287dc0fea74a18c927984108e84ac90b8b78
Contract Address: 0xfba38625bcfb7BBF420dDD163ac780530ad89d66
Block: 22295090
Gas Used: 794698

✅ Sequence #1 on mainnet | Total Paid: 0. ETH (794698 gas * avg 0 gwei)


==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
```
