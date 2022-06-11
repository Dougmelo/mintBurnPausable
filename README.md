# MintBurnPausable

MintBurnPausable é um projeto desenvolvido no programa Criptodev com a mentoria do JC Bombardelli, é um contrato ERC20 com foco nas funcionalidade Mint, Burn, Pausable, e testes com Chai e Mocha.

# Integrantes do projeto

```bash
Douglas Melo: https://github.com/Dougmelo/mintBurnPausable
Gabriel Duarte: https://github.com/xlDuarte/mintBurnPausable
Michel Lavanere: https://github.com/Lavanere/mintBurnPausable
```

# Instalar Dependências

```bash
git clone https://github.com/Dougmelo/mintBurnPausable.git
```

```bash
npm install
```

# Compilação 

```bash
npx hardhat compile
```

# Rodar testes 

```bash
npx hardhat test
```

# Funções
`mintBurnPausable` funcionalidades do contrato:
- `mint` - cria tokens adicionando o novo valor no totalSupply e na carteira Owner, está função apenas será realizada por o Owner do contrato
- `burn` - queima tokens adicionando o novo valor no totalSupply e na carteira Owner, está função apenas será realizada por o Owner do contrato
- `pause` - pausa toda a parte critica do contrato, impedindo de acessar suas principais funcionalidades para controle de bugs e ataques hackers, está função apenas será realizada por o Owner do contrato
- `unPause` - retira o contrato do modo pause, liberando todo o acesso as suas funcionalidades, está função apenas será realizada por o Owner do contrato
- `setAddressToBalanceSum` - criar novos tokens e os adiciona no totalSupplly e carteira desejada, está função apenas será realizada por o Owner do contrato
-  `setAddressToBalanceSum` - criar novos tokens e os adiciona no totalSupplly e carteira desejada, está função apenas será realizada por o Owner do contrato
- `transfer` - função usada para tranferir tokens entre inscritos do contrato
- `totalSupply` - mostra o totalSupply do contrato
- `owner` - tem controle total sobre o contrato, e não atribui um novo Owner


# Ajuda do Hardhat
```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
