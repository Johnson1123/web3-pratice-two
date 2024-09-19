// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Swap {

    mapping (string => address) tokens;

    

    string[] tokenId = ["TKA", "TKB", "TKC", "TKD"];

    constructor(address[] memory _tokens) {
        for (uint256 i; i < _tokens.length; i++) {

            if(_tokens[i] != address(0)){
                tokens[tokenId[i]] =  _tokens[i];
            }
        }
    }

    error ZEROADDRESS();
    error DEPOSITZEROADDRESS();
    error PURCHASEZEROADDRESS();
    error INSUFFICIENTUSERBALANCE();
    error INSUFFICENTCONTARCTBALANCE();
    error CANNOTDEPOSITZERO();
    error CANNOTPURCHASEDZERO();
    // error ();

    event Deposit(address indexed _tokenDeposit, uint256 indexed _amountDposited, address _purchasedToken, uint256 _amountPurchased);

    function swapTokenForToken(string memory _depositTokenId, uint96 _depositedAmount, string memory _purchaseTokenId, uint96 _purchaseAmount) external {

        if(msg.sender == address(0)){
            revert ZEROADDRESS();
        }

        if(tokens[_depositTokenId] == address(0)){
            revert DEPOSITZEROADDRESS();
        }

        if(tokens[_purchaseTokenId] == address(0)){
            revert PURCHASEZEROADDRESS();
        }

        if(_depositedAmount <= 0){
            revert CANNOTDEPOSITZERO();
        }

        if(_purchaseAmount <= 0){
            revert CANNOTPURCHASEDZERO();
        }

        uint256 _userBalance = IERC20(tokens[_depositTokenId]).balanceOf(msg.sender);
        uint256 _contractBalance = IERC20(tokens[_purchaseTokenId]).balanceOf(address(this));

        if(_userBalance < _depositedAmount){
            revert INSUFFICIENTUSERBALANCE();
        }

        if(_contractBalance < _purchaseAmount){
            revert INSUFFICENTCONTARCTBALANCE();
        }

        IERC20(tokens[_depositTokenId]).transferFrom(msg.sender, address(this), _depositedAmount);

        IERC20(address(this)).transfer(msg.sender, _purchaseAmount);

    }
}