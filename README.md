# Zora Timed Sale Strategy

The Zora Timed Sale Strategy introduces a new fixed price minting mechanism and enables secondary sales on Uniswap V3. New tokens minted will have a fixed price of 0.000111 ETH (111 sparks).

## Key Features

1. **Fixed Price Minting**: Tokens are minted at a fixed price of 0.000111 ETH.
2. **Timed Sale**: The sale has a configurable start time and a dynamic end time based on market conditions.
3. **Secondary Market**: Automatically launches a secondary market on Uniswap V3 after the primary sale ends.
4. **ERC20z Integration**: Creates an ERC20z token for each 1155 token, enabling liquidity provision on Uniswap V3.

## How It Works

1. **Setting Up a Sale**:

   - Call `setSaleV2()` to create a sale for a specific 1155 NFT.
   - This function creates an ERC20z token and a Uniswap V3 pool for the token.

2. **Minting**:

   - Users can mint tokens during the sale period using the `mint()` function.
   - The minting price is fixed at 0.000111 ETH per token.

3. **Market Launch**:
   - After the sale ends and meets the minimum ETH threshold, `launchMarket()` can be called.
   - This deploys liquidity into the Uniswap V3 pool, enabling secondary market trading.

## Key Components

### ERC20z

ERC20z is an extension of the ERC20 standard that includes metadata and allows for wrapping and unwrapping of Zora 1155 tokens.

### Royalties

The Royalties contract manages royalty distribution from secondary market sales on Uniswap V3. Creators can earn LP liquidity rewards and collect royalties using this contract.

## Usage

1. Deploy the ZoraTimedSaleStrategy contract.
2. For each 1155 token sale, call `setSaleV2()` with the appropriate parameters.
3. Users can mint tokens using the `mint()` function during the sale period.
4. After the sale ends and meets conditions, call `launchMarket()` to enable secondary trading.

## Important Functions

- `setSaleV2()`: Set up a new sale for a token.
- `updateSale()`: Update an existing sale's parameters.
- `mint()`: Allow users to mint tokens during the sale.
- `launchMarket()`: Launch the secondary market after the primary sale ends.

For detailed information on function parameters and usage, please refer to the contract documentation.

## Security Considerations

- Ensure proper access control for admin functions.
- Verify that the minimum market ETH and market countdown parameters are set appropriately for your use case.
- Be aware of the fixed minting price and its implications for your token's economics.

For more details on implementation, please refer to the contract source code and comments.
