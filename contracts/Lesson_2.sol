// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    string message = "Hello"; // state
    uint public balance;

    // может быть payable (необязательно)
    // вызывается, если относительно смарт-контракта была вызвана транзакция с неизвестным именем ф-ии
    fallback() external payable {
        // throw an exception for example
    }

    // обязательно external и payable
    // ф-ия типа fallback, вызывается, если пришли средства, но нет указаний, какую ф-ию нужно выполнить
    receive() external payable{
        balance += msg.value;
    }

    // payable
    function pay() external payable {
        balance += msg.value;
    }

    // transaction
    function setMessage(string memory newMessage) external {
        message = newMessage;
    }

    // call
    function getBalance() public view returns(uint _balance) {
        // Альтернативная версия возвращения значения из функции
        // uint balance = address(this).balance;
        // return balance;

        _balance = address(this).balance;
    }

    // call
    function getMessage() external view returns(string memory) {
        return message;
    }

    // call
    function rate(uint amount) public pure returns(uint) {
        return amount * 3;
    }
}