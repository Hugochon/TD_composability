## TD Composability

For this TD, you will be evaluated in two ways:
- first by sending to the teacher your github repository because for all exercises, you must write some solidity code or use `cast` tool but not just call etherscan. Please complete `IStudentToken.sol` and `IStudentNft.sol` also.
- second by calling exercice functions when needing (variable `exerciceProgression` will be check for evaluation)


**Here are specifics details:**

Ex 1: Deploy an ERC20 contract (2pts)

Ex 2: Mint your ERC20 tokens by calling `ex2_mintStudentToken` (2pts)

Ex 3: Mint some EvaluatorTokens by calling `ex3_mintEvaluatorToken` (2 pts)

Ex 4: From your smart contract, you must call uniswap V3 smart contracts in order to swap EvaluatorToken <> RewardToken. Then call `ex4_checkRewardTokenBalance`  (2 pts)

Ex 5: You must send to the Evaluator smart contract some RewardToken by calling `ex5_checkRewardTokenBalance` (2 pts)

Ex 6: Create a liquidity pool on uniswap V3 between your ERC20 tokens and some WETH. You must use Uniswap smart contracts (2 pts)

Ex 7: Deploy an ERC721 (2 pts)

Ex 8: Mint some ERC721's by calling `ex8_mintNFT` (2 pts)

Ex 9: Ouch... my Evaluator contract is admin of your ERC721 token. He has full rights and you must call `ex9_burnNft` (1 pts)

Ex 10: Verify your smart contract on Etherscan and sourcify (1 pts)

Ex 11: Simply call `ex11_unlock_ethers` (2 pts)

BONUS:
- You succeed to make all the TD in one transaction (1 pt)
- You can automate some tasks (like deployment) in a makefile (1 pt)


-----------------------------------------
Deployed Addresses on goerli:
- [Evaluator contract](https://goerli.etherscan.io/address/0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE)
- [Reward contract](https://goerli.etherscan.io/address/0x56822085cf7C15219f6dC404Ba24749f08f34173)


-----------------------------------------
## My Work on this TD

I did my work with this address : ```0x1C008e7B38a1CCf4219a815dE65bFc3004b936e5```

My ERC20 address : ```0x8AB75d4CD630025ceB789b153184CAE129A100AA```

My ERC721 address : ```0x103B735ef09Da7368486c039df27877c4C68f8D6```

Question 1 : 

forge script script/StudentToken_Deployment.sol:DeploymentScript --rpc-url $GOERLI_RPC_URL --broadcast -vvvv


Question 2 :

Appeler la fonction ex2 (il faut permettre au contrat du prof de se transferer 0.00000001 token, donc approve etc…)
forge script script/StudentToken_Deployment.sol:DeploymentScript --rpc-url $GOERLI_RPC_URL --broadcast -vvvv

Call `ex2_mintStudentToken`


Question 3 :

Envoyer 20 000 000 de plus pour l’adresse du prof et valider la fonction ex3
cast send 0x8AB75d4CD630025ceB789b153184CAE129A100AA "transfer(address,uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 20000000 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

Call la fonction `ex3_mintEvaluatorToken` :
cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex3_mintEvaluatorToken()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY


Question 4 :

Swapper Evaluator Token to Reward Token on Uniswap 
Swap sur le front d’Uniswap V3.

Puis call la fonction `ex4_checkRewardTokenBalance` de l’évaluateur :
cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex4_checkRewardTokenBalance()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY


Question 5 :

Send to the Evaluator Smart Contract some Reward Token
Allow the Evaluator Contract to transferFrom the RewardToken
cast send 0x56822085cf7C15219f6dC404Ba24749f08f34173 "approve(address,uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 10000000000000000000 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

Then call the `ex5_checkRewardTokenBalance` : 
cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex5_checkRewardTokenBalance()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY


Question 7 :

Deploy a NFT contract
forge create --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY src/StudentNFT.sol:StudentNFT


Question 8 :

Mint some ERC721 
Register the NFT contract :
cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "registerStudentNft(address)" 0x103B735ef09Da7368486c039df27877c4C68f8D6 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY 

Call `ex8_mintNFT` :
cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex8_mintNFT()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY 


Question 10 :

Verify contract on Etherscan and Sourcify
Ethersan : forge verify-contract 0x103B735ef09Da7368486c039df27877c4C68f8D6 StudentNFT --watch --chain-id 5
Sourcify : from their website
