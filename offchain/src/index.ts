import { ethers } from "ethers";
import AggregatorV3InterfaceAbi from "./utils/ABI/AggregatorV3Interface";
const RPC_URL = "https://rpc.buildbear.io/sensitive-katebishop-8c1e5d33";
const provider = new ethers.JsonRpcProvider(RPC_URL);

const aggregatorV3InterfaceABI = AggregatorV3InterfaceAbi;

// NOTE: Refer to the following URL for price feeds:
// https://docs.chain.link/data-feeds/price-feeds/addresses?page=1&search=usdt
const addr = "0xEe9F2375b4bdF6387aa8265dD4FB8F16512A1d46"; // USDT/ETH feed
const priceFeed = new ethers.Contract(addr, aggregatorV3InterfaceABI, provider);

const feedDescription = await priceFeed.description();
const feedDecimals = await priceFeed.decimals();

const { roundId, answer, startedAt, updatedAt, answeredInRound } =
  await priceFeed.latestRoundData();

console.log(`Price Feed Description ${feedDescription}`);
console.log(`Price Feed Decimals ${feedDecimals}`);
console.log(`roundId: ${roundId}`);
console.log(`answer: ${answer}`);
console.log(`startedAt: ${startedAt}`);
console.log(`updatedAt: ${updatedAt}`);
console.log(`answeredInRound: ${answeredInRound}`);
console.log(
  `Price ${feedDescription} : ${ethers.formatUnits(answer, feedDecimals)}`
);
console.log(
  `Price of 1${feedDescription.split("/")[1]} = ${
    1 / +ethers.formatUnits(answer, feedDecimals)
  }`
);
