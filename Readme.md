
#### Desctription

Simple contract for testing signing message, deployed on Rinkeby network [0x7f8A1b417C087ba1D1800f529838DFa2d555bd4b](https://rinkeby.etherscan.io/address/0x7f8A1b417C087ba1D1800f529838DFa2d555bd4b)

  
#### How it work

1. Create your party data with format : `[idParty (int), owner party address (address), party name(string)]`

2. Convert party data to hash, you can use `getMessageHash` function

3. Signing hash message, if you use Remix, you can use signing feature https://prnt.sc/15vg84q
4. When signing complete, you will get the signature, copy the signature and split in Remix Console using command `ethers.utils.splitSignature({the signature})`. Output example https://prnt.sc/15vh1h0
5. Prepare you signature data with format: `[v (int256) , r (byte32), s (byte32)]`
6. Create your party using `createParty` function.