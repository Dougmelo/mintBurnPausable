// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IERC20{

    //Implementado (mais ou menos)
    function totalSupply() external view returns(uint256);
    function balanceOf(address account) external view returns(uint256);
    function transfer(address recipient, uint256 amount) external returns(bool);
    function getOwner() external view returns(address);

    //Não implementados (ainda)
    //function allowence(address owner, address spender) external view returns(uint256);
    //function approve(address spender, uint256 amount) external returns(bool);
    //function transferFrom(address sender, address recipient, uint256 amount) external returns(bool);

    //Implementado
    event Transfer(address from, address to, uint256 value);

    //Não está implementado (ainda)
    //event Approval(address owner, address spender, uint256 value);

}

contract CryptoToken is IERC20{

    //Properties
    string public constant name = "CryptoToken";
    string public constant symbol = "CRY";
    uint8 public constant decimals = 3;  //Default dos exemplos é sempre 18
    uint256 private totalsupply;
    address private owner; 
    bool private paused; 

    mapping(address => uint256) private addressToBalance;

    // Events
    //event Transfer(address sender, address receiver, uint256 amount);
 
    //Constructor
    constructor(uint256 total) {
        owner = msg.sender;
        mint(msg.sender, total);
    }

     modifier isOwner() {
        require(msg.sender == owner , "Sender is not owner!");
        _;
    }

  
    function mint(address account, uint256 amount) public isOwner {
    _isPaused();    
    require(amount > 0);
    setAddressToBalanceSum(account, amount);
    emit Transfer(address(0), account, amount);
    }
    
    function burn(uint256 amount) public isOwner {
    _isPaused();
    require(amount != 0);
    require(amount <= addressToBalance[msg.sender]);
    setAddressToBalanceSub(amount);
    emit Transfer(msg.sender, address(0), amount);
    }

    //Public Functions
    function totalSupply() public override view returns(uint256) {
        _isPaused();
        return totalsupply;
    }

    function setTotalSupply(uint256 amount) private isOwner{
        _isPaused();
        totalsupply = amount;
    }


     function getOwner() public override view returns(address) {
        _isPaused(); 
        return owner;
    }

    function setAddressToBalanceSum(address tokenOwner, uint256 amount) public isOwner{
    _isPaused();
    uint256 _totalSupply = totalSupply() + amount;
    setTotalSupply(_totalSupply);
    addressToBalance[tokenOwner] = addressToBalance[tokenOwner] + amount;
    }

    function setAddressToBalanceSub(uint256 amount) public isOwner{
    _isPaused();
    uint256 _totalSupply = totalSupply() - amount;
    setTotalSupply(_totalSupply);
    addressToBalance[msg.sender] = addressToBalance[msg.sender] - amount;
    }

    function balanceOf(address tokenOwner) public override view returns(uint256) {
        _isPaused();
        return addressToBalance[tokenOwner];
    }

    //FIX: Ta feio, podemos melhorar
    function transfer(address receiver, uint256 quantity) public override returns(bool) {
        _isPaused();
        require(quantity <= addressToBalance[msg.sender], "Insufficient Balance to Transfer");
        addressToBalance[msg.sender] = addressToBalance[msg.sender] - quantity;
        addressToBalance[receiver] = addressToBalance[receiver] + quantity;

        emit Transfer(msg.sender, receiver, quantity);
        return true;
    }
    
    function pause() public isOwner {
        _isPaused();
        paused = true;
    }

    function unPause() public isOwner {
        paused = false;
    }

    function _isPaused() private view{
        require(paused == false,"This contract is paused.");
    }

    function isPaused() public view returns(bool){
        return paused;
    }
}